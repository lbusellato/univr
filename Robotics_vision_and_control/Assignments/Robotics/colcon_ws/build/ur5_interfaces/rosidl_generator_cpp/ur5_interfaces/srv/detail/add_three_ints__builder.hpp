// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from ur5_interfaces:srv/AddThreeInts.idl
// generated code does not contain a copyright notice

#ifndef UR5_INTERFACES__SRV__DETAIL__ADD_THREE_INTS__BUILDER_HPP_
#define UR5_INTERFACES__SRV__DETAIL__ADD_THREE_INTS__BUILDER_HPP_

#include "ur5_interfaces/srv/detail/add_three_ints__struct.hpp"
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <utility>


namespace ur5_interfaces
{

namespace srv
{

namespace builder
{

class Init_AddThreeInts_Request_c
{
public:
  explicit Init_AddThreeInts_Request_c(::ur5_interfaces::srv::AddThreeInts_Request & msg)
  : msg_(msg)
  {}
  ::ur5_interfaces::srv::AddThreeInts_Request c(::ur5_interfaces::srv::AddThreeInts_Request::_c_type arg)
  {
    msg_.c = std::move(arg);
    return std::move(msg_);
  }

private:
  ::ur5_interfaces::srv::AddThreeInts_Request msg_;
};

class Init_AddThreeInts_Request_b
{
public:
  explicit Init_AddThreeInts_Request_b(::ur5_interfaces::srv::AddThreeInts_Request & msg)
  : msg_(msg)
  {}
  Init_AddThreeInts_Request_c b(::ur5_interfaces::srv::AddThreeInts_Request::_b_type arg)
  {
    msg_.b = std::move(arg);
    return Init_AddThreeInts_Request_c(msg_);
  }

private:
  ::ur5_interfaces::srv::AddThreeInts_Request msg_;
};

class Init_AddThreeInts_Request_a
{
public:
  Init_AddThreeInts_Request_a()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_AddThreeInts_Request_b a(::ur5_interfaces::srv::AddThreeInts_Request::_a_type arg)
  {
    msg_.a = std::move(arg);
    return Init_AddThreeInts_Request_b(msg_);
  }

private:
  ::ur5_interfaces::srv::AddThreeInts_Request msg_;
};

}  // namespace builder

}  // namespace srv

template<typename MessageType>
auto build();

template<>
inline
auto build<::ur5_interfaces::srv::AddThreeInts_Request>()
{
  return ur5_interfaces::srv::builder::Init_AddThreeInts_Request_a();
}

}  // namespace ur5_interfaces


namespace ur5_interfaces
{

namespace srv
{

namespace builder
{

class Init_AddThreeInts_Response_sum
{
public:
  Init_AddThreeInts_Response_sum()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  ::ur5_interfaces::srv::AddThreeInts_Response sum(::ur5_interfaces::srv::AddThreeInts_Response::_sum_type arg)
  {
    msg_.sum = std::move(arg);
    return std::move(msg_);
  }

private:
  ::ur5_interfaces::srv::AddThreeInts_Response msg_;
};

}  // namespace builder

}  // namespace srv

template<typename MessageType>
auto build();

template<>
inline
auto build<::ur5_interfaces::srv::AddThreeInts_Response>()
{
  return ur5_interfaces::srv::builder::Init_AddThreeInts_Response_sum();
}

}  // namespace ur5_interfaces

#endif  // UR5_INTERFACES__SRV__DETAIL__ADD_THREE_INTS__BUILDER_HPP_
