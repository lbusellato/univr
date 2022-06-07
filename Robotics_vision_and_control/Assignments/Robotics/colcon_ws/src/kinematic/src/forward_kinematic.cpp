
#include <kinematic/forward_kinematic.hpp>

using namespace std::chrono_literals;

/* This example creates a subclass of Node and uses std::bind() to register a
 * member function as a callback from the timer. */

ForwardKinematic::ForwardKinematic() : Node("forward_kinematic_node")
{
    publisher1_ = this->create_publisher<geometry_msgs::msg::PoseStamped>("/ur5/ee_actual/pose", 1);
    subscription_ = this->create_subscription<sensor_msgs::msg::JointState>("/joint_states", 1, std::bind(&ForwardKinematic::joint_states_callback, this, std::placeholders::_1));

    this->declare_parameter<std::string>("robot_description");
    robot_desc_string = this->get_parameter("robot_description").as_string();


    timer_ = this->create_wall_timer(500ms, std::bind(&ForwardKinematic::publish_message, this));
}

void ForwardKinematic::joint_states_callback(const sensor_msgs::msg::JointState::SharedPtr msg)
{
    // RCLCPP_INFO(this->get_logger(), "Joint State ");
    for (int i = 0; i < 6; i++)
    {
        joint[i] = msg->position[i];
    }
}


void ForwardKinematic::publish_message()
{
    TRAC_IK::TRAC_IK tracik_solver(chain_start, chain_end, robot_desc_string, timeout, eps);
    bool valid = tracik_solver.getKDLChain(chain);
    if (!valid)
    {
        RCLCPP_ERROR(this->get_logger(), "There was no valid KDL chain found");
        return;
    }
    KDL::ChainFkSolverPos_recursive fk_solver(chain); // Forward kin. solver
    KDL::JntArray q(chain.getNrOfJoints());
    // rc = kdl_solver.CartToJnt(q, end_effector_pose, result);

    for (int i = 0; i < 6; i++)
    {
        q(i) = joint[i];
    }
    bool kinematics_status = fk_solver.JntToCart(q, fk_cartpos);
    if (kinematics_status)
    {
        RCLCPP_INFO(this->get_logger(), "Forward kinematic error");
    }
    
    double x_q, y_q, z_q, w_q;
    fk_cartpos.M.GetQuaternion(x_q, y_q, z_q, w_q);
    actual_ee_pose.header.stamp = this->now();
    actual_ee_pose.pose.position.x = fk_cartpos.p(0);
    actual_ee_pose.pose.position.y = fk_cartpos.p(1);
    actual_ee_pose.pose.position.z = fk_cartpos.p(2);
    actual_ee_pose.pose.orientation.x = x_q;
    actual_ee_pose.pose.orientation.y = y_q;
    actual_ee_pose.pose.orientation.z = z_q;
    actual_ee_pose.pose.orientation.w = w_q;


    publisher1_->publish(actual_ee_pose);

}

int main(int argc, char *argv[])
{
    rclcpp::init(argc, argv);
    rclcpp::spin(std::make_shared<ForwardKinematic>());
    rclcpp::shutdown();
    return 0;
}
