// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from ur5_interfaces:srv/Gripper.idl
// generated code does not contain a copyright notice

#ifndef UR5_INTERFACES__SRV__DETAIL__GRIPPER__TRAITS_HPP_
#define UR5_INTERFACES__SRV__DETAIL__GRIPPER__TRAITS_HPP_

#include "ur5_interfaces/srv/detail/gripper__struct.hpp"
#include <stdint.h>
#include <rosidl_runtime_cpp/traits.hpp>
#include <sstream>
#include <string>
#include <type_traits>

namespace rosidl_generator_traits
{

inline void to_yaml(
  const ur5_interfaces::srv::Gripper_Request & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: width
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "width: ";
    value_to_yaml(msg.width, out);
    out << "\n";
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const ur5_interfaces::srv::Gripper_Request & msg)
{
  std::ostringstream out;
  to_yaml(msg, out);
  return out.str();
}

template<>
inline const char * data_type<ur5_interfaces::srv::Gripper_Request>()
{
  return "ur5_interfaces::srv::Gripper_Request";
}

template<>
inline const char * name<ur5_interfaces::srv::Gripper_Request>()
{
  return "ur5_interfaces/srv/Gripper_Request";
}

template<>
struct has_fixed_size<ur5_interfaces::srv::Gripper_Request>
  : std::integral_constant<bool, true> {};

template<>
struct has_bounded_size<ur5_interfaces::srv::Gripper_Request>
  : std::integral_constant<bool, true> {};

template<>
struct is_message<ur5_interfaces::srv::Gripper_Request>
  : std::true_type {};

}  // namespace rosidl_generator_traits

namespace rosidl_generator_traits
{

inline void to_yaml(
  const ur5_interfaces::srv::Gripper_Response & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: status
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "status: ";
    value_to_yaml(msg.status, out);
    out << "\n";
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const ur5_interfaces::srv::Gripper_Response & msg)
{
  std::ostringstream out;
  to_yaml(msg, out);
  return out.str();
}

template<>
inline const char * data_type<ur5_interfaces::srv::Gripper_Response>()
{
  return "ur5_interfaces::srv::Gripper_Response";
}

template<>
inline const char * name<ur5_interfaces::srv::Gripper_Response>()
{
  return "ur5_interfaces/srv/Gripper_Response";
}

template<>
struct has_fixed_size<ur5_interfaces::srv::Gripper_Response>
  : std::integral_constant<bool, true> {};

template<>
struct has_bounded_size<ur5_interfaces::srv::Gripper_Response>
  : std::integral_constant<bool, true> {};

template<>
struct is_message<ur5_interfaces::srv::Gripper_Response>
  : std::true_type {};

}  // namespace rosidl_generator_traits

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<ur5_interfaces::srv::Gripper>()
{
  return "ur5_interfaces::srv::Gripper";
}

template<>
inline const char * name<ur5_interfaces::srv::Gripper>()
{
  return "ur5_interfaces/srv/Gripper";
}

template<>
struct has_fixed_size<ur5_interfaces::srv::Gripper>
  : std::integral_constant<
    bool,
    has_fixed_size<ur5_interfaces::srv::Gripper_Request>::value &&
    has_fixed_size<ur5_interfaces::srv::Gripper_Response>::value
  >
{
};

template<>
struct has_bounded_size<ur5_interfaces::srv::Gripper>
  : std::integral_constant<
    bool,
    has_bounded_size<ur5_interfaces::srv::Gripper_Request>::value &&
    has_bounded_size<ur5_interfaces::srv::Gripper_Response>::value
  >
{
};

template<>
struct is_service<ur5_interfaces::srv::Gripper>
  : std::true_type
{
};

template<>
struct is_service_request<ur5_interfaces::srv::Gripper_Request>
  : std::true_type
{
};

template<>
struct is_service_response<ur5_interfaces::srv::Gripper_Response>
  : std::true_type
{
};

}  // namespace rosidl_generator_traits

#endif  // UR5_INTERFACES__SRV__DETAIL__GRIPPER__TRAITS_HPP_
