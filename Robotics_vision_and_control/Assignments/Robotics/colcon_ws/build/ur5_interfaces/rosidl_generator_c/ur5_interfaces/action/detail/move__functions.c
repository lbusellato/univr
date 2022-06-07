// generated from rosidl_generator_c/resource/idl__functions.c.em
// with input from ur5_interfaces:action/Move.idl
// generated code does not contain a copyright notice
#include "ur5_interfaces/action/detail/move__functions.h"

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>


bool
ur5_interfaces__action__Move_Goal__init(ur5_interfaces__action__Move_Goal * msg)
{
  if (!msg) {
    return false;
  }
  // width
  // speed
  return true;
}

void
ur5_interfaces__action__Move_Goal__fini(ur5_interfaces__action__Move_Goal * msg)
{
  if (!msg) {
    return;
  }
  // width
  // speed
}

bool
ur5_interfaces__action__Move_Goal__are_equal(const ur5_interfaces__action__Move_Goal * lhs, const ur5_interfaces__action__Move_Goal * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // width
  if (lhs->width != rhs->width) {
    return false;
  }
  // speed
  if (lhs->speed != rhs->speed) {
    return false;
  }
  return true;
}

bool
ur5_interfaces__action__Move_Goal__copy(
  const ur5_interfaces__action__Move_Goal * input,
  ur5_interfaces__action__Move_Goal * output)
{
  if (!input || !output) {
    return false;
  }
  // width
  output->width = input->width;
  // speed
  output->speed = input->speed;
  return true;
}

ur5_interfaces__action__Move_Goal *
ur5_interfaces__action__Move_Goal__create()
{
  ur5_interfaces__action__Move_Goal * msg = (ur5_interfaces__action__Move_Goal *)malloc(sizeof(ur5_interfaces__action__Move_Goal));
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(ur5_interfaces__action__Move_Goal));
  bool success = ur5_interfaces__action__Move_Goal__init(msg);
  if (!success) {
    free(msg);
    return NULL;
  }
  return msg;
}

void
ur5_interfaces__action__Move_Goal__destroy(ur5_interfaces__action__Move_Goal * msg)
{
  if (msg) {
    ur5_interfaces__action__Move_Goal__fini(msg);
  }
  free(msg);
}


bool
ur5_interfaces__action__Move_Goal__Sequence__init(ur5_interfaces__action__Move_Goal__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  ur5_interfaces__action__Move_Goal * data = NULL;
  if (size) {
    data = (ur5_interfaces__action__Move_Goal *)calloc(size, sizeof(ur5_interfaces__action__Move_Goal));
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = ur5_interfaces__action__Move_Goal__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        ur5_interfaces__action__Move_Goal__fini(&data[i - 1]);
      }
      free(data);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
ur5_interfaces__action__Move_Goal__Sequence__fini(ur5_interfaces__action__Move_Goal__Sequence * array)
{
  if (!array) {
    return;
  }
  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      ur5_interfaces__action__Move_Goal__fini(&array->data[i]);
    }
    free(array->data);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

ur5_interfaces__action__Move_Goal__Sequence *
ur5_interfaces__action__Move_Goal__Sequence__create(size_t size)
{
  ur5_interfaces__action__Move_Goal__Sequence * array = (ur5_interfaces__action__Move_Goal__Sequence *)malloc(sizeof(ur5_interfaces__action__Move_Goal__Sequence));
  if (!array) {
    return NULL;
  }
  bool success = ur5_interfaces__action__Move_Goal__Sequence__init(array, size);
  if (!success) {
    free(array);
    return NULL;
  }
  return array;
}

void
ur5_interfaces__action__Move_Goal__Sequence__destroy(ur5_interfaces__action__Move_Goal__Sequence * array)
{
  if (array) {
    ur5_interfaces__action__Move_Goal__Sequence__fini(array);
  }
  free(array);
}

bool
ur5_interfaces__action__Move_Goal__Sequence__are_equal(const ur5_interfaces__action__Move_Goal__Sequence * lhs, const ur5_interfaces__action__Move_Goal__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!ur5_interfaces__action__Move_Goal__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
ur5_interfaces__action__Move_Goal__Sequence__copy(
  const ur5_interfaces__action__Move_Goal__Sequence * input,
  ur5_interfaces__action__Move_Goal__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(ur5_interfaces__action__Move_Goal);
    ur5_interfaces__action__Move_Goal * data =
      (ur5_interfaces__action__Move_Goal *)realloc(output->data, allocation_size);
    if (!data) {
      return false;
    }
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!ur5_interfaces__action__Move_Goal__init(&data[i])) {
        /* free currently allocated and return false */
        for (; i-- > output->capacity; ) {
          ur5_interfaces__action__Move_Goal__fini(&data[i]);
        }
        free(data);
        return false;
      }
    }
    output->data = data;
    output->capacity = input->size;
  }
  output->size = input->size;
  for (size_t i = 0; i < input->size; ++i) {
    if (!ur5_interfaces__action__Move_Goal__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}


bool
ur5_interfaces__action__Move_Result__init(ur5_interfaces__action__Move_Result * msg)
{
  if (!msg) {
    return false;
  }
  // status
  return true;
}

void
ur5_interfaces__action__Move_Result__fini(ur5_interfaces__action__Move_Result * msg)
{
  if (!msg) {
    return;
  }
  // status
}

bool
ur5_interfaces__action__Move_Result__are_equal(const ur5_interfaces__action__Move_Result * lhs, const ur5_interfaces__action__Move_Result * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // status
  if (lhs->status != rhs->status) {
    return false;
  }
  return true;
}

bool
ur5_interfaces__action__Move_Result__copy(
  const ur5_interfaces__action__Move_Result * input,
  ur5_interfaces__action__Move_Result * output)
{
  if (!input || !output) {
    return false;
  }
  // status
  output->status = input->status;
  return true;
}

ur5_interfaces__action__Move_Result *
ur5_interfaces__action__Move_Result__create()
{
  ur5_interfaces__action__Move_Result * msg = (ur5_interfaces__action__Move_Result *)malloc(sizeof(ur5_interfaces__action__Move_Result));
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(ur5_interfaces__action__Move_Result));
  bool success = ur5_interfaces__action__Move_Result__init(msg);
  if (!success) {
    free(msg);
    return NULL;
  }
  return msg;
}

void
ur5_interfaces__action__Move_Result__destroy(ur5_interfaces__action__Move_Result * msg)
{
  if (msg) {
    ur5_interfaces__action__Move_Result__fini(msg);
  }
  free(msg);
}


bool
ur5_interfaces__action__Move_Result__Sequence__init(ur5_interfaces__action__Move_Result__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  ur5_interfaces__action__Move_Result * data = NULL;
  if (size) {
    data = (ur5_interfaces__action__Move_Result *)calloc(size, sizeof(ur5_interfaces__action__Move_Result));
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = ur5_interfaces__action__Move_Result__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        ur5_interfaces__action__Move_Result__fini(&data[i - 1]);
      }
      free(data);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
ur5_interfaces__action__Move_Result__Sequence__fini(ur5_interfaces__action__Move_Result__Sequence * array)
{
  if (!array) {
    return;
  }
  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      ur5_interfaces__action__Move_Result__fini(&array->data[i]);
    }
    free(array->data);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

ur5_interfaces__action__Move_Result__Sequence *
ur5_interfaces__action__Move_Result__Sequence__create(size_t size)
{
  ur5_interfaces__action__Move_Result__Sequence * array = (ur5_interfaces__action__Move_Result__Sequence *)malloc(sizeof(ur5_interfaces__action__Move_Result__Sequence));
  if (!array) {
    return NULL;
  }
  bool success = ur5_interfaces__action__Move_Result__Sequence__init(array, size);
  if (!success) {
    free(array);
    return NULL;
  }
  return array;
}

void
ur5_interfaces__action__Move_Result__Sequence__destroy(ur5_interfaces__action__Move_Result__Sequence * array)
{
  if (array) {
    ur5_interfaces__action__Move_Result__Sequence__fini(array);
  }
  free(array);
}

bool
ur5_interfaces__action__Move_Result__Sequence__are_equal(const ur5_interfaces__action__Move_Result__Sequence * lhs, const ur5_interfaces__action__Move_Result__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!ur5_interfaces__action__Move_Result__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
ur5_interfaces__action__Move_Result__Sequence__copy(
  const ur5_interfaces__action__Move_Result__Sequence * input,
  ur5_interfaces__action__Move_Result__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(ur5_interfaces__action__Move_Result);
    ur5_interfaces__action__Move_Result * data =
      (ur5_interfaces__action__Move_Result *)realloc(output->data, allocation_size);
    if (!data) {
      return false;
    }
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!ur5_interfaces__action__Move_Result__init(&data[i])) {
        /* free currently allocated and return false */
        for (; i-- > output->capacity; ) {
          ur5_interfaces__action__Move_Result__fini(&data[i]);
        }
        free(data);
        return false;
      }
    }
    output->data = data;
    output->capacity = input->size;
  }
  output->size = input->size;
  for (size_t i = 0; i < input->size; ++i) {
    if (!ur5_interfaces__action__Move_Result__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}


bool
ur5_interfaces__action__Move_Feedback__init(ur5_interfaces__action__Move_Feedback * msg)
{
  if (!msg) {
    return false;
  }
  // done
  return true;
}

void
ur5_interfaces__action__Move_Feedback__fini(ur5_interfaces__action__Move_Feedback * msg)
{
  if (!msg) {
    return;
  }
  // done
}

bool
ur5_interfaces__action__Move_Feedback__are_equal(const ur5_interfaces__action__Move_Feedback * lhs, const ur5_interfaces__action__Move_Feedback * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // done
  if (lhs->done != rhs->done) {
    return false;
  }
  return true;
}

bool
ur5_interfaces__action__Move_Feedback__copy(
  const ur5_interfaces__action__Move_Feedback * input,
  ur5_interfaces__action__Move_Feedback * output)
{
  if (!input || !output) {
    return false;
  }
  // done
  output->done = input->done;
  return true;
}

ur5_interfaces__action__Move_Feedback *
ur5_interfaces__action__Move_Feedback__create()
{
  ur5_interfaces__action__Move_Feedback * msg = (ur5_interfaces__action__Move_Feedback *)malloc(sizeof(ur5_interfaces__action__Move_Feedback));
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(ur5_interfaces__action__Move_Feedback));
  bool success = ur5_interfaces__action__Move_Feedback__init(msg);
  if (!success) {
    free(msg);
    return NULL;
  }
  return msg;
}

void
ur5_interfaces__action__Move_Feedback__destroy(ur5_interfaces__action__Move_Feedback * msg)
{
  if (msg) {
    ur5_interfaces__action__Move_Feedback__fini(msg);
  }
  free(msg);
}


bool
ur5_interfaces__action__Move_Feedback__Sequence__init(ur5_interfaces__action__Move_Feedback__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  ur5_interfaces__action__Move_Feedback * data = NULL;
  if (size) {
    data = (ur5_interfaces__action__Move_Feedback *)calloc(size, sizeof(ur5_interfaces__action__Move_Feedback));
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = ur5_interfaces__action__Move_Feedback__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        ur5_interfaces__action__Move_Feedback__fini(&data[i - 1]);
      }
      free(data);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
ur5_interfaces__action__Move_Feedback__Sequence__fini(ur5_interfaces__action__Move_Feedback__Sequence * array)
{
  if (!array) {
    return;
  }
  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      ur5_interfaces__action__Move_Feedback__fini(&array->data[i]);
    }
    free(array->data);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

ur5_interfaces__action__Move_Feedback__Sequence *
ur5_interfaces__action__Move_Feedback__Sequence__create(size_t size)
{
  ur5_interfaces__action__Move_Feedback__Sequence * array = (ur5_interfaces__action__Move_Feedback__Sequence *)malloc(sizeof(ur5_interfaces__action__Move_Feedback__Sequence));
  if (!array) {
    return NULL;
  }
  bool success = ur5_interfaces__action__Move_Feedback__Sequence__init(array, size);
  if (!success) {
    free(array);
    return NULL;
  }
  return array;
}

void
ur5_interfaces__action__Move_Feedback__Sequence__destroy(ur5_interfaces__action__Move_Feedback__Sequence * array)
{
  if (array) {
    ur5_interfaces__action__Move_Feedback__Sequence__fini(array);
  }
  free(array);
}

bool
ur5_interfaces__action__Move_Feedback__Sequence__are_equal(const ur5_interfaces__action__Move_Feedback__Sequence * lhs, const ur5_interfaces__action__Move_Feedback__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!ur5_interfaces__action__Move_Feedback__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
ur5_interfaces__action__Move_Feedback__Sequence__copy(
  const ur5_interfaces__action__Move_Feedback__Sequence * input,
  ur5_interfaces__action__Move_Feedback__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(ur5_interfaces__action__Move_Feedback);
    ur5_interfaces__action__Move_Feedback * data =
      (ur5_interfaces__action__Move_Feedback *)realloc(output->data, allocation_size);
    if (!data) {
      return false;
    }
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!ur5_interfaces__action__Move_Feedback__init(&data[i])) {
        /* free currently allocated and return false */
        for (; i-- > output->capacity; ) {
          ur5_interfaces__action__Move_Feedback__fini(&data[i]);
        }
        free(data);
        return false;
      }
    }
    output->data = data;
    output->capacity = input->size;
  }
  output->size = input->size;
  for (size_t i = 0; i < input->size; ++i) {
    if (!ur5_interfaces__action__Move_Feedback__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}


// Include directives for member types
// Member `goal_id`
#include "unique_identifier_msgs/msg/detail/uuid__functions.h"
// Member `goal`
// already included above
// #include "ur5_interfaces/action/detail/move__functions.h"

bool
ur5_interfaces__action__Move_SendGoal_Request__init(ur5_interfaces__action__Move_SendGoal_Request * msg)
{
  if (!msg) {
    return false;
  }
  // goal_id
  if (!unique_identifier_msgs__msg__UUID__init(&msg->goal_id)) {
    ur5_interfaces__action__Move_SendGoal_Request__fini(msg);
    return false;
  }
  // goal
  if (!ur5_interfaces__action__Move_Goal__init(&msg->goal)) {
    ur5_interfaces__action__Move_SendGoal_Request__fini(msg);
    return false;
  }
  return true;
}

void
ur5_interfaces__action__Move_SendGoal_Request__fini(ur5_interfaces__action__Move_SendGoal_Request * msg)
{
  if (!msg) {
    return;
  }
  // goal_id
  unique_identifier_msgs__msg__UUID__fini(&msg->goal_id);
  // goal
  ur5_interfaces__action__Move_Goal__fini(&msg->goal);
}

bool
ur5_interfaces__action__Move_SendGoal_Request__are_equal(const ur5_interfaces__action__Move_SendGoal_Request * lhs, const ur5_interfaces__action__Move_SendGoal_Request * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // goal_id
  if (!unique_identifier_msgs__msg__UUID__are_equal(
      &(lhs->goal_id), &(rhs->goal_id)))
  {
    return false;
  }
  // goal
  if (!ur5_interfaces__action__Move_Goal__are_equal(
      &(lhs->goal), &(rhs->goal)))
  {
    return false;
  }
  return true;
}

bool
ur5_interfaces__action__Move_SendGoal_Request__copy(
  const ur5_interfaces__action__Move_SendGoal_Request * input,
  ur5_interfaces__action__Move_SendGoal_Request * output)
{
  if (!input || !output) {
    return false;
  }
  // goal_id
  if (!unique_identifier_msgs__msg__UUID__copy(
      &(input->goal_id), &(output->goal_id)))
  {
    return false;
  }
  // goal
  if (!ur5_interfaces__action__Move_Goal__copy(
      &(input->goal), &(output->goal)))
  {
    return false;
  }
  return true;
}

ur5_interfaces__action__Move_SendGoal_Request *
ur5_interfaces__action__Move_SendGoal_Request__create()
{
  ur5_interfaces__action__Move_SendGoal_Request * msg = (ur5_interfaces__action__Move_SendGoal_Request *)malloc(sizeof(ur5_interfaces__action__Move_SendGoal_Request));
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(ur5_interfaces__action__Move_SendGoal_Request));
  bool success = ur5_interfaces__action__Move_SendGoal_Request__init(msg);
  if (!success) {
    free(msg);
    return NULL;
  }
  return msg;
}

void
ur5_interfaces__action__Move_SendGoal_Request__destroy(ur5_interfaces__action__Move_SendGoal_Request * msg)
{
  if (msg) {
    ur5_interfaces__action__Move_SendGoal_Request__fini(msg);
  }
  free(msg);
}


bool
ur5_interfaces__action__Move_SendGoal_Request__Sequence__init(ur5_interfaces__action__Move_SendGoal_Request__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  ur5_interfaces__action__Move_SendGoal_Request * data = NULL;
  if (size) {
    data = (ur5_interfaces__action__Move_SendGoal_Request *)calloc(size, sizeof(ur5_interfaces__action__Move_SendGoal_Request));
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = ur5_interfaces__action__Move_SendGoal_Request__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        ur5_interfaces__action__Move_SendGoal_Request__fini(&data[i - 1]);
      }
      free(data);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
ur5_interfaces__action__Move_SendGoal_Request__Sequence__fini(ur5_interfaces__action__Move_SendGoal_Request__Sequence * array)
{
  if (!array) {
    return;
  }
  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      ur5_interfaces__action__Move_SendGoal_Request__fini(&array->data[i]);
    }
    free(array->data);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

ur5_interfaces__action__Move_SendGoal_Request__Sequence *
ur5_interfaces__action__Move_SendGoal_Request__Sequence__create(size_t size)
{
  ur5_interfaces__action__Move_SendGoal_Request__Sequence * array = (ur5_interfaces__action__Move_SendGoal_Request__Sequence *)malloc(sizeof(ur5_interfaces__action__Move_SendGoal_Request__Sequence));
  if (!array) {
    return NULL;
  }
  bool success = ur5_interfaces__action__Move_SendGoal_Request__Sequence__init(array, size);
  if (!success) {
    free(array);
    return NULL;
  }
  return array;
}

void
ur5_interfaces__action__Move_SendGoal_Request__Sequence__destroy(ur5_interfaces__action__Move_SendGoal_Request__Sequence * array)
{
  if (array) {
    ur5_interfaces__action__Move_SendGoal_Request__Sequence__fini(array);
  }
  free(array);
}

bool
ur5_interfaces__action__Move_SendGoal_Request__Sequence__are_equal(const ur5_interfaces__action__Move_SendGoal_Request__Sequence * lhs, const ur5_interfaces__action__Move_SendGoal_Request__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!ur5_interfaces__action__Move_SendGoal_Request__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
ur5_interfaces__action__Move_SendGoal_Request__Sequence__copy(
  const ur5_interfaces__action__Move_SendGoal_Request__Sequence * input,
  ur5_interfaces__action__Move_SendGoal_Request__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(ur5_interfaces__action__Move_SendGoal_Request);
    ur5_interfaces__action__Move_SendGoal_Request * data =
      (ur5_interfaces__action__Move_SendGoal_Request *)realloc(output->data, allocation_size);
    if (!data) {
      return false;
    }
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!ur5_interfaces__action__Move_SendGoal_Request__init(&data[i])) {
        /* free currently allocated and return false */
        for (; i-- > output->capacity; ) {
          ur5_interfaces__action__Move_SendGoal_Request__fini(&data[i]);
        }
        free(data);
        return false;
      }
    }
    output->data = data;
    output->capacity = input->size;
  }
  output->size = input->size;
  for (size_t i = 0; i < input->size; ++i) {
    if (!ur5_interfaces__action__Move_SendGoal_Request__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}


// Include directives for member types
// Member `stamp`
#include "builtin_interfaces/msg/detail/time__functions.h"

bool
ur5_interfaces__action__Move_SendGoal_Response__init(ur5_interfaces__action__Move_SendGoal_Response * msg)
{
  if (!msg) {
    return false;
  }
  // accepted
  // stamp
  if (!builtin_interfaces__msg__Time__init(&msg->stamp)) {
    ur5_interfaces__action__Move_SendGoal_Response__fini(msg);
    return false;
  }
  return true;
}

void
ur5_interfaces__action__Move_SendGoal_Response__fini(ur5_interfaces__action__Move_SendGoal_Response * msg)
{
  if (!msg) {
    return;
  }
  // accepted
  // stamp
  builtin_interfaces__msg__Time__fini(&msg->stamp);
}

bool
ur5_interfaces__action__Move_SendGoal_Response__are_equal(const ur5_interfaces__action__Move_SendGoal_Response * lhs, const ur5_interfaces__action__Move_SendGoal_Response * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // accepted
  if (lhs->accepted != rhs->accepted) {
    return false;
  }
  // stamp
  if (!builtin_interfaces__msg__Time__are_equal(
      &(lhs->stamp), &(rhs->stamp)))
  {
    return false;
  }
  return true;
}

bool
ur5_interfaces__action__Move_SendGoal_Response__copy(
  const ur5_interfaces__action__Move_SendGoal_Response * input,
  ur5_interfaces__action__Move_SendGoal_Response * output)
{
  if (!input || !output) {
    return false;
  }
  // accepted
  output->accepted = input->accepted;
  // stamp
  if (!builtin_interfaces__msg__Time__copy(
      &(input->stamp), &(output->stamp)))
  {
    return false;
  }
  return true;
}

ur5_interfaces__action__Move_SendGoal_Response *
ur5_interfaces__action__Move_SendGoal_Response__create()
{
  ur5_interfaces__action__Move_SendGoal_Response * msg = (ur5_interfaces__action__Move_SendGoal_Response *)malloc(sizeof(ur5_interfaces__action__Move_SendGoal_Response));
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(ur5_interfaces__action__Move_SendGoal_Response));
  bool success = ur5_interfaces__action__Move_SendGoal_Response__init(msg);
  if (!success) {
    free(msg);
    return NULL;
  }
  return msg;
}

void
ur5_interfaces__action__Move_SendGoal_Response__destroy(ur5_interfaces__action__Move_SendGoal_Response * msg)
{
  if (msg) {
    ur5_interfaces__action__Move_SendGoal_Response__fini(msg);
  }
  free(msg);
}


bool
ur5_interfaces__action__Move_SendGoal_Response__Sequence__init(ur5_interfaces__action__Move_SendGoal_Response__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  ur5_interfaces__action__Move_SendGoal_Response * data = NULL;
  if (size) {
    data = (ur5_interfaces__action__Move_SendGoal_Response *)calloc(size, sizeof(ur5_interfaces__action__Move_SendGoal_Response));
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = ur5_interfaces__action__Move_SendGoal_Response__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        ur5_interfaces__action__Move_SendGoal_Response__fini(&data[i - 1]);
      }
      free(data);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
ur5_interfaces__action__Move_SendGoal_Response__Sequence__fini(ur5_interfaces__action__Move_SendGoal_Response__Sequence * array)
{
  if (!array) {
    return;
  }
  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      ur5_interfaces__action__Move_SendGoal_Response__fini(&array->data[i]);
    }
    free(array->data);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

ur5_interfaces__action__Move_SendGoal_Response__Sequence *
ur5_interfaces__action__Move_SendGoal_Response__Sequence__create(size_t size)
{
  ur5_interfaces__action__Move_SendGoal_Response__Sequence * array = (ur5_interfaces__action__Move_SendGoal_Response__Sequence *)malloc(sizeof(ur5_interfaces__action__Move_SendGoal_Response__Sequence));
  if (!array) {
    return NULL;
  }
  bool success = ur5_interfaces__action__Move_SendGoal_Response__Sequence__init(array, size);
  if (!success) {
    free(array);
    return NULL;
  }
  return array;
}

void
ur5_interfaces__action__Move_SendGoal_Response__Sequence__destroy(ur5_interfaces__action__Move_SendGoal_Response__Sequence * array)
{
  if (array) {
    ur5_interfaces__action__Move_SendGoal_Response__Sequence__fini(array);
  }
  free(array);
}

bool
ur5_interfaces__action__Move_SendGoal_Response__Sequence__are_equal(const ur5_interfaces__action__Move_SendGoal_Response__Sequence * lhs, const ur5_interfaces__action__Move_SendGoal_Response__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!ur5_interfaces__action__Move_SendGoal_Response__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
ur5_interfaces__action__Move_SendGoal_Response__Sequence__copy(
  const ur5_interfaces__action__Move_SendGoal_Response__Sequence * input,
  ur5_interfaces__action__Move_SendGoal_Response__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(ur5_interfaces__action__Move_SendGoal_Response);
    ur5_interfaces__action__Move_SendGoal_Response * data =
      (ur5_interfaces__action__Move_SendGoal_Response *)realloc(output->data, allocation_size);
    if (!data) {
      return false;
    }
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!ur5_interfaces__action__Move_SendGoal_Response__init(&data[i])) {
        /* free currently allocated and return false */
        for (; i-- > output->capacity; ) {
          ur5_interfaces__action__Move_SendGoal_Response__fini(&data[i]);
        }
        free(data);
        return false;
      }
    }
    output->data = data;
    output->capacity = input->size;
  }
  output->size = input->size;
  for (size_t i = 0; i < input->size; ++i) {
    if (!ur5_interfaces__action__Move_SendGoal_Response__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}


// Include directives for member types
// Member `goal_id`
// already included above
// #include "unique_identifier_msgs/msg/detail/uuid__functions.h"

bool
ur5_interfaces__action__Move_GetResult_Request__init(ur5_interfaces__action__Move_GetResult_Request * msg)
{
  if (!msg) {
    return false;
  }
  // goal_id
  if (!unique_identifier_msgs__msg__UUID__init(&msg->goal_id)) {
    ur5_interfaces__action__Move_GetResult_Request__fini(msg);
    return false;
  }
  return true;
}

void
ur5_interfaces__action__Move_GetResult_Request__fini(ur5_interfaces__action__Move_GetResult_Request * msg)
{
  if (!msg) {
    return;
  }
  // goal_id
  unique_identifier_msgs__msg__UUID__fini(&msg->goal_id);
}

bool
ur5_interfaces__action__Move_GetResult_Request__are_equal(const ur5_interfaces__action__Move_GetResult_Request * lhs, const ur5_interfaces__action__Move_GetResult_Request * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // goal_id
  if (!unique_identifier_msgs__msg__UUID__are_equal(
      &(lhs->goal_id), &(rhs->goal_id)))
  {
    return false;
  }
  return true;
}

bool
ur5_interfaces__action__Move_GetResult_Request__copy(
  const ur5_interfaces__action__Move_GetResult_Request * input,
  ur5_interfaces__action__Move_GetResult_Request * output)
{
  if (!input || !output) {
    return false;
  }
  // goal_id
  if (!unique_identifier_msgs__msg__UUID__copy(
      &(input->goal_id), &(output->goal_id)))
  {
    return false;
  }
  return true;
}

ur5_interfaces__action__Move_GetResult_Request *
ur5_interfaces__action__Move_GetResult_Request__create()
{
  ur5_interfaces__action__Move_GetResult_Request * msg = (ur5_interfaces__action__Move_GetResult_Request *)malloc(sizeof(ur5_interfaces__action__Move_GetResult_Request));
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(ur5_interfaces__action__Move_GetResult_Request));
  bool success = ur5_interfaces__action__Move_GetResult_Request__init(msg);
  if (!success) {
    free(msg);
    return NULL;
  }
  return msg;
}

void
ur5_interfaces__action__Move_GetResult_Request__destroy(ur5_interfaces__action__Move_GetResult_Request * msg)
{
  if (msg) {
    ur5_interfaces__action__Move_GetResult_Request__fini(msg);
  }
  free(msg);
}


bool
ur5_interfaces__action__Move_GetResult_Request__Sequence__init(ur5_interfaces__action__Move_GetResult_Request__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  ur5_interfaces__action__Move_GetResult_Request * data = NULL;
  if (size) {
    data = (ur5_interfaces__action__Move_GetResult_Request *)calloc(size, sizeof(ur5_interfaces__action__Move_GetResult_Request));
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = ur5_interfaces__action__Move_GetResult_Request__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        ur5_interfaces__action__Move_GetResult_Request__fini(&data[i - 1]);
      }
      free(data);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
ur5_interfaces__action__Move_GetResult_Request__Sequence__fini(ur5_interfaces__action__Move_GetResult_Request__Sequence * array)
{
  if (!array) {
    return;
  }
  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      ur5_interfaces__action__Move_GetResult_Request__fini(&array->data[i]);
    }
    free(array->data);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

ur5_interfaces__action__Move_GetResult_Request__Sequence *
ur5_interfaces__action__Move_GetResult_Request__Sequence__create(size_t size)
{
  ur5_interfaces__action__Move_GetResult_Request__Sequence * array = (ur5_interfaces__action__Move_GetResult_Request__Sequence *)malloc(sizeof(ur5_interfaces__action__Move_GetResult_Request__Sequence));
  if (!array) {
    return NULL;
  }
  bool success = ur5_interfaces__action__Move_GetResult_Request__Sequence__init(array, size);
  if (!success) {
    free(array);
    return NULL;
  }
  return array;
}

void
ur5_interfaces__action__Move_GetResult_Request__Sequence__destroy(ur5_interfaces__action__Move_GetResult_Request__Sequence * array)
{
  if (array) {
    ur5_interfaces__action__Move_GetResult_Request__Sequence__fini(array);
  }
  free(array);
}

bool
ur5_interfaces__action__Move_GetResult_Request__Sequence__are_equal(const ur5_interfaces__action__Move_GetResult_Request__Sequence * lhs, const ur5_interfaces__action__Move_GetResult_Request__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!ur5_interfaces__action__Move_GetResult_Request__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
ur5_interfaces__action__Move_GetResult_Request__Sequence__copy(
  const ur5_interfaces__action__Move_GetResult_Request__Sequence * input,
  ur5_interfaces__action__Move_GetResult_Request__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(ur5_interfaces__action__Move_GetResult_Request);
    ur5_interfaces__action__Move_GetResult_Request * data =
      (ur5_interfaces__action__Move_GetResult_Request *)realloc(output->data, allocation_size);
    if (!data) {
      return false;
    }
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!ur5_interfaces__action__Move_GetResult_Request__init(&data[i])) {
        /* free currently allocated and return false */
        for (; i-- > output->capacity; ) {
          ur5_interfaces__action__Move_GetResult_Request__fini(&data[i]);
        }
        free(data);
        return false;
      }
    }
    output->data = data;
    output->capacity = input->size;
  }
  output->size = input->size;
  for (size_t i = 0; i < input->size; ++i) {
    if (!ur5_interfaces__action__Move_GetResult_Request__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}


// Include directives for member types
// Member `result`
// already included above
// #include "ur5_interfaces/action/detail/move__functions.h"

bool
ur5_interfaces__action__Move_GetResult_Response__init(ur5_interfaces__action__Move_GetResult_Response * msg)
{
  if (!msg) {
    return false;
  }
  // status
  // result
  if (!ur5_interfaces__action__Move_Result__init(&msg->result)) {
    ur5_interfaces__action__Move_GetResult_Response__fini(msg);
    return false;
  }
  return true;
}

void
ur5_interfaces__action__Move_GetResult_Response__fini(ur5_interfaces__action__Move_GetResult_Response * msg)
{
  if (!msg) {
    return;
  }
  // status
  // result
  ur5_interfaces__action__Move_Result__fini(&msg->result);
}

bool
ur5_interfaces__action__Move_GetResult_Response__are_equal(const ur5_interfaces__action__Move_GetResult_Response * lhs, const ur5_interfaces__action__Move_GetResult_Response * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // status
  if (lhs->status != rhs->status) {
    return false;
  }
  // result
  if (!ur5_interfaces__action__Move_Result__are_equal(
      &(lhs->result), &(rhs->result)))
  {
    return false;
  }
  return true;
}

bool
ur5_interfaces__action__Move_GetResult_Response__copy(
  const ur5_interfaces__action__Move_GetResult_Response * input,
  ur5_interfaces__action__Move_GetResult_Response * output)
{
  if (!input || !output) {
    return false;
  }
  // status
  output->status = input->status;
  // result
  if (!ur5_interfaces__action__Move_Result__copy(
      &(input->result), &(output->result)))
  {
    return false;
  }
  return true;
}

ur5_interfaces__action__Move_GetResult_Response *
ur5_interfaces__action__Move_GetResult_Response__create()
{
  ur5_interfaces__action__Move_GetResult_Response * msg = (ur5_interfaces__action__Move_GetResult_Response *)malloc(sizeof(ur5_interfaces__action__Move_GetResult_Response));
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(ur5_interfaces__action__Move_GetResult_Response));
  bool success = ur5_interfaces__action__Move_GetResult_Response__init(msg);
  if (!success) {
    free(msg);
    return NULL;
  }
  return msg;
}

void
ur5_interfaces__action__Move_GetResult_Response__destroy(ur5_interfaces__action__Move_GetResult_Response * msg)
{
  if (msg) {
    ur5_interfaces__action__Move_GetResult_Response__fini(msg);
  }
  free(msg);
}


bool
ur5_interfaces__action__Move_GetResult_Response__Sequence__init(ur5_interfaces__action__Move_GetResult_Response__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  ur5_interfaces__action__Move_GetResult_Response * data = NULL;
  if (size) {
    data = (ur5_interfaces__action__Move_GetResult_Response *)calloc(size, sizeof(ur5_interfaces__action__Move_GetResult_Response));
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = ur5_interfaces__action__Move_GetResult_Response__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        ur5_interfaces__action__Move_GetResult_Response__fini(&data[i - 1]);
      }
      free(data);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
ur5_interfaces__action__Move_GetResult_Response__Sequence__fini(ur5_interfaces__action__Move_GetResult_Response__Sequence * array)
{
  if (!array) {
    return;
  }
  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      ur5_interfaces__action__Move_GetResult_Response__fini(&array->data[i]);
    }
    free(array->data);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

ur5_interfaces__action__Move_GetResult_Response__Sequence *
ur5_interfaces__action__Move_GetResult_Response__Sequence__create(size_t size)
{
  ur5_interfaces__action__Move_GetResult_Response__Sequence * array = (ur5_interfaces__action__Move_GetResult_Response__Sequence *)malloc(sizeof(ur5_interfaces__action__Move_GetResult_Response__Sequence));
  if (!array) {
    return NULL;
  }
  bool success = ur5_interfaces__action__Move_GetResult_Response__Sequence__init(array, size);
  if (!success) {
    free(array);
    return NULL;
  }
  return array;
}

void
ur5_interfaces__action__Move_GetResult_Response__Sequence__destroy(ur5_interfaces__action__Move_GetResult_Response__Sequence * array)
{
  if (array) {
    ur5_interfaces__action__Move_GetResult_Response__Sequence__fini(array);
  }
  free(array);
}

bool
ur5_interfaces__action__Move_GetResult_Response__Sequence__are_equal(const ur5_interfaces__action__Move_GetResult_Response__Sequence * lhs, const ur5_interfaces__action__Move_GetResult_Response__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!ur5_interfaces__action__Move_GetResult_Response__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
ur5_interfaces__action__Move_GetResult_Response__Sequence__copy(
  const ur5_interfaces__action__Move_GetResult_Response__Sequence * input,
  ur5_interfaces__action__Move_GetResult_Response__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(ur5_interfaces__action__Move_GetResult_Response);
    ur5_interfaces__action__Move_GetResult_Response * data =
      (ur5_interfaces__action__Move_GetResult_Response *)realloc(output->data, allocation_size);
    if (!data) {
      return false;
    }
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!ur5_interfaces__action__Move_GetResult_Response__init(&data[i])) {
        /* free currently allocated and return false */
        for (; i-- > output->capacity; ) {
          ur5_interfaces__action__Move_GetResult_Response__fini(&data[i]);
        }
        free(data);
        return false;
      }
    }
    output->data = data;
    output->capacity = input->size;
  }
  output->size = input->size;
  for (size_t i = 0; i < input->size; ++i) {
    if (!ur5_interfaces__action__Move_GetResult_Response__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}


// Include directives for member types
// Member `goal_id`
// already included above
// #include "unique_identifier_msgs/msg/detail/uuid__functions.h"
// Member `feedback`
// already included above
// #include "ur5_interfaces/action/detail/move__functions.h"

bool
ur5_interfaces__action__Move_FeedbackMessage__init(ur5_interfaces__action__Move_FeedbackMessage * msg)
{
  if (!msg) {
    return false;
  }
  // goal_id
  if (!unique_identifier_msgs__msg__UUID__init(&msg->goal_id)) {
    ur5_interfaces__action__Move_FeedbackMessage__fini(msg);
    return false;
  }
  // feedback
  if (!ur5_interfaces__action__Move_Feedback__init(&msg->feedback)) {
    ur5_interfaces__action__Move_FeedbackMessage__fini(msg);
    return false;
  }
  return true;
}

void
ur5_interfaces__action__Move_FeedbackMessage__fini(ur5_interfaces__action__Move_FeedbackMessage * msg)
{
  if (!msg) {
    return;
  }
  // goal_id
  unique_identifier_msgs__msg__UUID__fini(&msg->goal_id);
  // feedback
  ur5_interfaces__action__Move_Feedback__fini(&msg->feedback);
}

bool
ur5_interfaces__action__Move_FeedbackMessage__are_equal(const ur5_interfaces__action__Move_FeedbackMessage * lhs, const ur5_interfaces__action__Move_FeedbackMessage * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // goal_id
  if (!unique_identifier_msgs__msg__UUID__are_equal(
      &(lhs->goal_id), &(rhs->goal_id)))
  {
    return false;
  }
  // feedback
  if (!ur5_interfaces__action__Move_Feedback__are_equal(
      &(lhs->feedback), &(rhs->feedback)))
  {
    return false;
  }
  return true;
}

bool
ur5_interfaces__action__Move_FeedbackMessage__copy(
  const ur5_interfaces__action__Move_FeedbackMessage * input,
  ur5_interfaces__action__Move_FeedbackMessage * output)
{
  if (!input || !output) {
    return false;
  }
  // goal_id
  if (!unique_identifier_msgs__msg__UUID__copy(
      &(input->goal_id), &(output->goal_id)))
  {
    return false;
  }
  // feedback
  if (!ur5_interfaces__action__Move_Feedback__copy(
      &(input->feedback), &(output->feedback)))
  {
    return false;
  }
  return true;
}

ur5_interfaces__action__Move_FeedbackMessage *
ur5_interfaces__action__Move_FeedbackMessage__create()
{
  ur5_interfaces__action__Move_FeedbackMessage * msg = (ur5_interfaces__action__Move_FeedbackMessage *)malloc(sizeof(ur5_interfaces__action__Move_FeedbackMessage));
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(ur5_interfaces__action__Move_FeedbackMessage));
  bool success = ur5_interfaces__action__Move_FeedbackMessage__init(msg);
  if (!success) {
    free(msg);
    return NULL;
  }
  return msg;
}

void
ur5_interfaces__action__Move_FeedbackMessage__destroy(ur5_interfaces__action__Move_FeedbackMessage * msg)
{
  if (msg) {
    ur5_interfaces__action__Move_FeedbackMessage__fini(msg);
  }
  free(msg);
}


bool
ur5_interfaces__action__Move_FeedbackMessage__Sequence__init(ur5_interfaces__action__Move_FeedbackMessage__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  ur5_interfaces__action__Move_FeedbackMessage * data = NULL;
  if (size) {
    data = (ur5_interfaces__action__Move_FeedbackMessage *)calloc(size, sizeof(ur5_interfaces__action__Move_FeedbackMessage));
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = ur5_interfaces__action__Move_FeedbackMessage__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        ur5_interfaces__action__Move_FeedbackMessage__fini(&data[i - 1]);
      }
      free(data);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
ur5_interfaces__action__Move_FeedbackMessage__Sequence__fini(ur5_interfaces__action__Move_FeedbackMessage__Sequence * array)
{
  if (!array) {
    return;
  }
  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      ur5_interfaces__action__Move_FeedbackMessage__fini(&array->data[i]);
    }
    free(array->data);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

ur5_interfaces__action__Move_FeedbackMessage__Sequence *
ur5_interfaces__action__Move_FeedbackMessage__Sequence__create(size_t size)
{
  ur5_interfaces__action__Move_FeedbackMessage__Sequence * array = (ur5_interfaces__action__Move_FeedbackMessage__Sequence *)malloc(sizeof(ur5_interfaces__action__Move_FeedbackMessage__Sequence));
  if (!array) {
    return NULL;
  }
  bool success = ur5_interfaces__action__Move_FeedbackMessage__Sequence__init(array, size);
  if (!success) {
    free(array);
    return NULL;
  }
  return array;
}

void
ur5_interfaces__action__Move_FeedbackMessage__Sequence__destroy(ur5_interfaces__action__Move_FeedbackMessage__Sequence * array)
{
  if (array) {
    ur5_interfaces__action__Move_FeedbackMessage__Sequence__fini(array);
  }
  free(array);
}

bool
ur5_interfaces__action__Move_FeedbackMessage__Sequence__are_equal(const ur5_interfaces__action__Move_FeedbackMessage__Sequence * lhs, const ur5_interfaces__action__Move_FeedbackMessage__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!ur5_interfaces__action__Move_FeedbackMessage__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
ur5_interfaces__action__Move_FeedbackMessage__Sequence__copy(
  const ur5_interfaces__action__Move_FeedbackMessage__Sequence * input,
  ur5_interfaces__action__Move_FeedbackMessage__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(ur5_interfaces__action__Move_FeedbackMessage);
    ur5_interfaces__action__Move_FeedbackMessage * data =
      (ur5_interfaces__action__Move_FeedbackMessage *)realloc(output->data, allocation_size);
    if (!data) {
      return false;
    }
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!ur5_interfaces__action__Move_FeedbackMessage__init(&data[i])) {
        /* free currently allocated and return false */
        for (; i-- > output->capacity; ) {
          ur5_interfaces__action__Move_FeedbackMessage__fini(&data[i]);
        }
        free(data);
        return false;
      }
    }
    output->data = data;
    output->capacity = input->size;
  }
  output->size = input->size;
  for (size_t i = 0; i < input->size; ++i) {
    if (!ur5_interfaces__action__Move_FeedbackMessage__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}
