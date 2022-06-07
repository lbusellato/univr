
#ifndef MAIN_HPP
#define MAIN_HPP

#include <chrono>
#include <functional>
#include <memory>
#include <string>
#include <iostream>
#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"
#include <kdl_parser/kdl_parser.hpp>
#include "trac_ik/trac_ik.hpp"
#include <sensor_msgs/msg/joint_state.hpp>
#include "kdl/chainiksolverpos_nr_jl.hpp"
#include <kdl/chainfksolverpos_recursive.hpp>
#include <array>
#include <geometry_msgs/msg/pose_stamped.hpp>
#include <std_msgs/msg/float32_multi_array.hpp>


class ForwardKinematic : public rclcpp::Node
{
    public:
        ForwardKinematic();
        

    private:
        //KDL::Tree my_tree;
        std::string robot_desc_string;
        std::string chain_start = "robot_arm_base_link";
        std::string chain_end = "robot_wsg50_base_link";
        rclcpp::TimerBase::SharedPtr timer_;

        rclcpp::Publisher<geometry_msgs::msg::PoseStamped>::SharedPtr publisher1_;
        rclcpp::Subscription<sensor_msgs::msg::JointState>::SharedPtr subscription_;

        double eps = 1e-5;
        double timeout = 0.005;
        KDL::Chain chain;
        std::array<float, 6> joint;


        KDL::Frame fk_cartpos;

        std_msgs::msg::Float32MultiArray new_joint_msg;
        geometry_msgs::msg::PoseStamped actual_ee_pose;

        //void init_parameters();
        void publish_message();
        void joint_states_callback(const sensor_msgs::msg::JointState::SharedPtr msg);


};

#endif