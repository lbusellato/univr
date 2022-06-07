// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from ur5_interfaces:srv/Gripper.idl
// generated code does not contain a copyright notice

#ifndef UR5_INTERFACES__SRV__DETAIL__GRIPPER__STRUCT_HPP_
#define UR5_INTERFACES__SRV__DETAIL__GRIPPER__STRUCT_HPP_

#include <rosidl_runtime_cpp/bounded_vector.hpp>
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <array>
#include <memory>
#include <string>
#include <vector>


#ifndef _WIN32
# define DEPRECATED__ur5_interfaces__srv__Gripper_Request __attribute__((deprecated))
#else
# define DEPRECATED__ur5_interfaces__srv__Gripper_Request __declspec(deprecated)
#endif

namespace ur5_interfaces
{

namespace srv
{

// message struct
template<class ContainerAllocator>
struct Gripper_Request_
{
  using Type = Gripper_Request_<ContainerAllocator>;

  explicit Gripper_Request_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->width = 0.0f;
    }
  }

  explicit Gripper_Request_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    (void)_alloc;
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->width = 0.0f;
    }
  }

  // field types and members
  using _width_type =
    float;
  _width_type width;

  // setters for named parameter idiom
  Type & set__width(
    const float & _arg)
  {
    this->width = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    ur5_interfaces::srv::Gripper_Request_<ContainerAllocator> *;
  using ConstRawPtr =
    const ur5_interfaces::srv::Gripper_Request_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<ur5_interfaces::srv::Gripper_Request_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<ur5_interfaces::srv::Gripper_Request_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      ur5_interfaces::srv::Gripper_Request_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<ur5_interfaces::srv::Gripper_Request_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      ur5_interfaces::srv::Gripper_Request_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<ur5_interfaces::srv::Gripper_Request_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<ur5_interfaces::srv::Gripper_Request_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<ur5_interfaces::srv::Gripper_Request_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__ur5_interfaces__srv__Gripper_Request
    std::shared_ptr<ur5_interfaces::srv::Gripper_Request_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__ur5_interfaces__srv__Gripper_Request
    std::shared_ptr<ur5_interfaces::srv::Gripper_Request_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const Gripper_Request_ & other) const
  {
    if (this->width != other.width) {
      return false;
    }
    return true;
  }
  bool operator!=(const Gripper_Request_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct Gripper_Request_

// alias to use template instance with default allocator
using Gripper_Request =
  ur5_interfaces::srv::Gripper_Request_<std::allocator<void>>;

// constant definitions

}  // namespace srv

}  // namespace ur5_interfaces


#ifndef _WIN32
# define DEPRECATED__ur5_interfaces__srv__Gripper_Response __attribute__((deprecated))
#else
# define DEPRECATED__ur5_interfaces__srv__Gripper_Response __declspec(deprecated)
#endif

namespace ur5_interfaces
{

namespace srv
{

// message struct
template<class ContainerAllocator>
struct Gripper_Response_
{
  using Type = Gripper_Response_<ContainerAllocator>;

  explicit Gripper_Response_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->status = false;
    }
  }

  explicit Gripper_Response_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    (void)_alloc;
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->status = false;
    }
  }

  // field types and members
  using _status_type =
    bool;
  _status_type status;

  // setters for named parameter idiom
  Type & set__status(
    const bool & _arg)
  {
    this->status = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    ur5_interfaces::srv::Gripper_Response_<ContainerAllocator> *;
  using ConstRawPtr =
    const ur5_interfaces::srv::Gripper_Response_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<ur5_interfaces::srv::Gripper_Response_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<ur5_interfaces::srv::Gripper_Response_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      ur5_interfaces::srv::Gripper_Response_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<ur5_interfaces::srv::Gripper_Response_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      ur5_interfaces::srv::Gripper_Response_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<ur5_interfaces::srv::Gripper_Response_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<ur5_interfaces::srv::Gripper_Response_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<ur5_interfaces::srv::Gripper_Response_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__ur5_interfaces__srv__Gripper_Response
    std::shared_ptr<ur5_interfaces::srv::Gripper_Response_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__ur5_interfaces__srv__Gripper_Response
    std::shared_ptr<ur5_interfaces::srv::Gripper_Response_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const Gripper_Response_ & other) const
  {
    if (this->status != other.status) {
      return false;
    }
    return true;
  }
  bool operator!=(const Gripper_Response_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct Gripper_Response_

// alias to use template instance with default allocator
using Gripper_Response =
  ur5_interfaces::srv::Gripper_Response_<std::allocator<void>>;

// constant definitions

}  // namespace srv

}  // namespace ur5_interfaces

namespace ur5_interfaces
{

namespace srv
{

struct Gripper
{
  using Request = ur5_interfaces::srv::Gripper_Request;
  using Response = ur5_interfaces::srv::Gripper_Response;
};

}  // namespace srv

}  // namespace ur5_interfaces

#endif  // UR5_INTERFACES__SRV__DETAIL__GRIPPER__STRUCT_HPP_
