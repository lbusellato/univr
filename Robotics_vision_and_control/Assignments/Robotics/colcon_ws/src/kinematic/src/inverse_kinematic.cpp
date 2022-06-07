#include <kinematic/inverse_kinematic.hpp>

using namespace std::chrono_literals;

/* This example creates a subclass of Node and uses std::bind() to register a
 * member function as a callback from the timer. */

InverseKinematic::InverseKinematic() : Node("inverse_kinematic_node")
{
    publisher_ = this->create_publisher<std_msgs::msg::Float32MultiArray>("/ur5/IK_joints", 1);
    subscription_ = this->create_subscription<sensor_msgs::msg::JointState>("/joint_states", 1, std::bind(&InverseKinematic::joint_states_callback, this, std::placeholders::_1));
    subscription1_ = this->create_subscription<geometry_msgs::msg::PoseStamped>("/ur5/ee_target/pose", 1, std::bind(&InverseKinematic::target_callback, this, std::placeholders::_1));
///ur5/ee_target/pose
    this->declare_parameter<std::string>("robot_description");
    robot_desc_string = this->get_parameter("robot_description").as_string();

    timer_ = this->create_wall_timer(500ms, std::bind(&InverseKinematic::publish_message, this));
}

void InverseKinematic::joint_states_callback(const sensor_msgs::msg::JointState::SharedPtr msg)
{
    for (int i = 0; i < 6; i++)
    {
        joint[i] = msg->position[i];
    }
}
void InverseKinematic::target_callback(const geometry_msgs::msg::PoseStamped::SharedPtr msg)
{
    // RCLCPP_INFO(this->get_logger(), "Pose target ");
    // tf::poseMsgToKDL(msg->pose, end_effector_pose);
    end_effector_pose.p[0] = msg->pose.position.x;
    end_effector_pose.p[1] = msg->pose.position.y;
    end_effector_pose.p[2] = msg->pose.position.z;
    end_effector_pose.M = KDL::Rotation::Quaternion(msg->pose.orientation.x, msg->pose.orientation.y, msg->pose.orientation.z, msg->pose.orientation.w);
    new_msg = true;
}

void InverseKinematic::publish_message()
{
    TRAC_IK::TRAC_IK tracik_solver(chain_start, chain_end, robot_desc_string, timeout, eps);
    bool valid = tracik_solver.getKDLChain(chain);
    if (!valid)
    {
        RCLCPP_ERROR(this->get_logger(), "There was no valid KDL chain found");
        return;
    }
    KDL::JntArray q(chain.getNrOfJoints());

    for (int i = 0; i < 6; i++)
    {
        q(i) = joint[i];
    }
    if(new_msg){
        rc = tracik_solver.CartToJnt(q, end_effector_pose, result);
        if (rc < 0)
        {
            RCLCPP_INFO(this->get_logger(), "Inverse kinematic error");
        }

        new_joint_msg.data.clear();
        new_joint_msg.layout.dim.push_back(std_msgs::msg::MultiArrayDimension());
        new_joint_msg.layout.dim[0].size = chain.getNrOfJoints();
        new_joint_msg.layout.dim[0].stride = 1;
        new_joint_msg.layout.dim[0].label = "New joints";

        for (int i = 0; i < 6; i++)
        {
            new_joint_msg.data.push_back(result(i));
        }


        publisher_->publish(new_joint_msg);


        RCLCPP_INFO(this->get_logger(), "New Joint %f, %f, %f, %f, %f, %f", result(0), result(1), result(2), result(3), result(4), result(5));
        new_msg = false;
    }
}

int main(int argc, char *argv[])
{
    rclcpp::init(argc, argv);
    rclcpp::spin(std::make_shared<InverseKinematic>());
    rclcpp::shutdown();
    return 0;
}
