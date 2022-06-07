// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from ur5_interfaces:srv/Gripper.idl
// generated code does not contain a copyright notice

#ifndef UR5_INTERFACES__SRV__DETAIL__GRIPPER__BUILDER_HPP_
#define UR5_INTERFACES__SRV__DETAIL__GRIPPER__BUILDER_HPP_

#include "ur5_interfaces/srv/detail/gripper__struct.hpp"
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <utility>


namespace ur5_interfaces
{

namespace srv
{

namespace builder
{

class Init_Gripper_Request_width
{
public:
  Init_Gripper_Request_width()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  ::ur5_interfaces::srv::Gripper_Request width(::ur5_interfaces::srv::Gripper_Request::_width_type arg)
  {
    msg_.width = std::move(arg);
    return std::move(msg_);
  }

private:
  ::ur5_interfaces::srv::Gripper_Request msg_;
};

}  // namespace builder

}  // namespace srv

template<typename MessageType>
auto build();

template<>
inline
auto build<::ur5_interfaces::srv::Gripper_Request>()
{
  return ur5_interfaces::srv::builder::Init_Gripper_Request_width();
}

}  // namespace ur5_interfaces


namespace ur5_interfaces
{

namespace srv
{

namespace builder
{

class Init_Gripper_Response_status
{
public:
  Init_Gripper_Response_status()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  ::ur5_interfaces::srv::Gripper_Response status(::ur5_interfaces::srv::Gripper_Response::_status_type arg)
  {
    msg_.status = std::move(arg);
    return std::move(msg_);
  }

private:
  ::ur5_interfaces::srv::Gripper_Response msg_;
};

}  // namespace builder

}  // namespace srv

template<typename MessageType>
auto build();

template<>
inline
auto build<::ur5_interfaces::srv::Gripper_Response>()
{
  return ur5_interfaces::srv::builder::Init_Gripper_Response_status();
}

}  // namespace ur5_interfaces

#endif  // UR5_INTERFACES__SRV__DETAIL__GRIPPER__BUILDER_HPP_
