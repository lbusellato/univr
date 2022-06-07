// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from ur5_interfaces:srv/Gripper.idl
// generated code does not contain a copyright notice

#ifndef UR5_INTERFACES__SRV__DETAIL__GRIPPER__STRUCT_H_
#define UR5_INTERFACES__SRV__DETAIL__GRIPPER__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Struct defined in srv/Gripper in the package ur5_interfaces.
typedef struct ur5_interfaces__srv__Gripper_Request
{
  float width;
} ur5_interfaces__srv__Gripper_Request;

// Struct for a sequence of ur5_interfaces__srv__Gripper_Request.
typedef struct ur5_interfaces__srv__Gripper_Request__Sequence
{
  ur5_interfaces__srv__Gripper_Request * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} ur5_interfaces__srv__Gripper_Request__Sequence;


// Constants defined in the message

// Struct defined in srv/Gripper in the package ur5_interfaces.
typedef struct ur5_interfaces__srv__Gripper_Response
{
  bool status;
} ur5_interfaces__srv__Gripper_Response;

// Struct for a sequence of ur5_interfaces__srv__Gripper_Response.
typedef struct ur5_interfaces__srv__Gripper_Response__Sequence
{
  ur5_interfaces__srv__Gripper_Response * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} ur5_interfaces__srv__Gripper_Response__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // UR5_INTERFACES__SRV__DETAIL__GRIPPER__STRUCT_H_
