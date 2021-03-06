// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from ur5_interfaces:srv/AddThreeInts.idl
// generated code does not contain a copyright notice

#ifndef UR5_INTERFACES__SRV__DETAIL__ADD_THREE_INTS__TRAITS_HPP_
#define UR5_INTERFACES__SRV__DETAIL__ADD_THREE_INTS__TRAITS_HPP_

#include "ur5_interfaces/srv/detail/add_three_ints__struct.hpp"
#include <stdint.h>
#include <rosidl_runtime_cpp/traits.hpp>
#include <sstream>
#include <string>
#include <type_traits>

namespace rosidl_generator_traits
{

inline void to_yaml(
  const ur5_interfaces::srv::AddThreeInts_Request & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: a
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "a: ";
    value_to_yaml(msg.a, out);
    out << "\n";
  }

  // member: b
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "b: ";
    value_to_yaml(msg.b, out);
    out << "\n";
  }

  // member: c
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "c: ";
    value_to_yaml(msg.c, out);
    out << "\n";
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const ur5_interfaces::srv::AddThreeInts_Request & msg)
{
  std::ostringstream out;
  to_yaml(msg, out);
  return out.str();
}

template<>
inline const char * data_type<ur5_interfaces::srv::AddThreeInts_Request>()
{
  return "ur5_interfaces::srv::AddThreeInts_Request";
}

template<>
inline const char * name<ur5_interfaces::srv::AddThreeInts_Request>()
{
  return "ur5_interfaces/srv/AddThreeInts_Request";
}

template<>
struct has_fixed_size<ur5_interfaces::srv::AddThreeInts_Request>
  : std::integral_constant<bool, true> {};

template<>
struct has_bounded_size<ur5_interfaces::srv::AddThreeInts_Request>
  : std::integral_constant<bool, true> {};

template<>
struct is_message<ur5_interfaces::srv::AddThreeInts_Request>
  : std::true_type {};

}  // namespace rosidl_generator_traits

namespace rosidl_generator_traits
{

inline void to_yaml(
  const ur5_interfaces::srv::AddThreeInts_Response & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: sum
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "sum: ";
    value_to_yaml(msg.sum, out);
    out << "\n";
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const ur5_interfaces::srv::AddThreeInts_Response & msg)
{
  std::ostringstream out;
  to_yaml(msg, out);
  return out.str();
}

template<>
inline const char * data_type<ur5_interfaces::srv::AddThreeInts_Response>()
{
  return "ur5_interfaces::srv::AddThreeInts_Response";
}

template<>
inline const char * name<ur5_interfaces::srv::AddThreeInts_Response>()
{
  return "ur5_interfaces/srv/AddThreeInts_Response";
}

template<>
struct has_fixed_size<ur5_interfaces::srv::AddThreeInts_Response>
  : std::integral_constant<bool, true> {};

template<>
struct has_bounded_size<ur5_interfaces::srv::AddThreeInts_Response>
  : std::integral_constant<bool, true> {};

template<>
struct is_message<ur5_interfaces::srv::AddThreeInts_Response>
  : std::true_type {};

}  // namespace rosidl_generator_traits

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<ur5_interfaces::srv::AddThreeInts>()
{
  return "ur5_interfaces::srv::AddThreeInts";
}

template<>
inline const char * name<ur5_interfaces::srv::AddThreeInts>()
{
  return "ur5_interfaces/srv/AddThreeInts";
}

template<>
struct has_fixed_size<ur5_interfaces::srv::AddThreeInts>
  : std::integral_constant<
    bool,
    has_fixed_size<ur5_interfaces::srv::AddThreeInts_Request>::value &&
    has_fixed_size<ur5_interfaces::srv::AddThreeInts_Response>::value
  >
{
};

template<>
struct has_bounded_size<ur5_interfaces::srv::AddThreeInts>
  : std::integral_constant<
    bool,
    has_bounded_size<ur5_interfaces::srv::AddThreeInts_Request>::value &&
    has_bounded_size<ur5_interfaces::srv::AddThreeInts_Response>::value
  >
{
};

template<>
struct is_service<ur5_interfaces::srv::AddThreeInts>
  : std::true_type
{
};

template<>
struct is_service_request<ur5_interfaces::srv::AddThreeInts_Request>
  : std::true_type
{
};

template<>
struct is_service_response<ur5_interfaces::srv::AddThreeInts_Response>
  : std::true_type
{
};

}  // namespace rosidl_generator_traits

#endif  // UR5_INTERFACES__SRV__DETAIL__ADD_THREE_INTS__TRAITS_HPP_
