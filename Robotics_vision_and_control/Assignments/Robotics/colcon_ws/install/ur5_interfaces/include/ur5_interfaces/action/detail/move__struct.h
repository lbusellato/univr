// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from ur5_interfaces:action/Move.idl
// generated code does not contain a copyright notice

#ifndef UR5_INTERFACES__ACTION__DETAIL__MOVE__STRUCT_H_
#define UR5_INTERFACES__ACTION__DETAIL__MOVE__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Struct defined in action/Move in the package ur5_interfaces.
typedef struct ur5_interfaces__action__Move_Goal
{
  float width;
  float speed;
} ur5_interfaces__action__Move_Goal;

// Struct for a sequence of ur5_interfaces__action__Move_Goal.
typedef struct ur5_interfaces__action__Move_Goal__Sequence
{
  ur5_interfaces__action__Move_Goal * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} ur5_interfaces__action__Move_Goal__Sequence;


// Constants defined in the message

// Struct defined in action/Move in the package ur5_interfaces.
typedef struct ur5_interfaces__action__Move_Result
{
  bool status;
} ur5_interfaces__action__Move_Result;

// Struct for a sequence of ur5_interfaces__action__Move_Result.
typedef struct ur5_interfaces__action__Move_Result__Sequence
{
  ur5_interfaces__action__Move_Result * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} ur5_interfaces__action__Move_Result__Sequence;


// Constants defined in the message

// Struct defined in action/Move in the package ur5_interfaces.
typedef struct ur5_interfaces__action__Move_Feedback
{
  bool done;
} ur5_interfaces__action__Move_Feedback;

// Struct for a sequence of ur5_interfaces__action__Move_Feedback.
typedef struct ur5_interfaces__action__Move_Feedback__Sequence
{
  ur5_interfaces__action__Move_Feedback * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} ur5_interfaces__action__Move_Feedback__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'goal_id'
#include "unique_identifier_msgs/msg/detail/uuid__struct.h"
// Member 'goal'
#include "ur5_interfaces/action/detail/move__struct.h"

// Struct defined in action/Move in the package ur5_interfaces.
typedef struct ur5_interfaces__action__Move_SendGoal_Request
{
  unique_identifier_msgs__msg__UUID goal_id;
  ur5_interfaces__action__Move_Goal goal;
} ur5_interfaces__action__Move_SendGoal_Request;

// Struct for a sequence of ur5_interfaces__action__Move_SendGoal_Request.
typedef struct ur5_interfaces__action__Move_SendGoal_Request__Sequence
{
  ur5_interfaces__action__Move_SendGoal_Request * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} ur5_interfaces__action__Move_SendGoal_Request__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'stamp'
#include "builtin_interfaces/msg/detail/time__struct.h"

// Struct defined in action/Move in the package ur5_interfaces.
typedef struct ur5_interfaces__action__Move_SendGoal_Response
{
  bool accepted;
  builtin_interfaces__msg__Time stamp;
} ur5_interfaces__action__Move_SendGoal_Response;

// Struct for a sequence of ur5_interfaces__action__Move_SendGoal_Response.
typedef struct ur5_interfaces__action__Move_SendGoal_Response__Sequence
{
  ur5_interfaces__action__Move_SendGoal_Response * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} ur5_interfaces__action__Move_SendGoal_Response__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'goal_id'
// already included above
// #include "unique_identifier_msgs/msg/detail/uuid__struct.h"

// Struct defined in action/Move in the package ur5_interfaces.
typedef struct ur5_interfaces__action__Move_GetResult_Request
{
  unique_identifier_msgs__msg__UUID goal_id;
} ur5_interfaces__action__Move_GetResult_Request;

// Struct for a sequence of ur5_interfaces__action__Move_GetResult_Request.
typedef struct ur5_interfaces__action__Move_GetResult_Request__Sequence
{
  ur5_interfaces__action__Move_GetResult_Request * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} ur5_interfaces__action__Move_GetResult_Request__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'result'
// already included above
// #include "ur5_interfaces/action/detail/move__struct.h"

// Struct defined in action/Move in the package ur5_interfaces.
typedef struct ur5_interfaces__action__Move_GetResult_Response
{
  int8_t status;
  ur5_interfaces__action__Move_Result result;
} ur5_interfaces__action__Move_GetResult_Response;

// Struct for a sequence of ur5_interfaces__action__Move_GetResult_Response.
typedef struct ur5_interfaces__action__Move_GetResult_Response__Sequence
{
  ur5_interfaces__action__Move_GetResult_Response * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} ur5_interfaces__action__Move_GetResult_Response__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'goal_id'
// already included above
// #include "unique_identifier_msgs/msg/detail/uuid__struct.h"
// Member 'feedback'
// already included above
// #include "ur5_interfaces/action/detail/move__struct.h"

// Struct defined in action/Move in the package ur5_interfaces.
typedef struct ur5_interfaces__action__Move_FeedbackMessage
{
  unique_identifier_msgs__msg__UUID goal_id;
  ur5_interfaces__action__Move_Feedback feedback;
} ur5_interfaces__action__Move_FeedbackMessage;

// Struct for a sequence of ur5_interfaces__action__Move_FeedbackMessage.
typedef struct ur5_interfaces__action__Move_FeedbackMessage__Sequence
{
  ur5_interfaces__action__Move_FeedbackMessage * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} ur5_interfaces__action__Move_FeedbackMessage__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // UR5_INTERFACES__ACTION__DETAIL__MOVE__STRUCT_H_
