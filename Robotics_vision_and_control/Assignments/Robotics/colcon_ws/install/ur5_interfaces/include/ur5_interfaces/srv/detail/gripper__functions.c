// generated from rosidl_generator_c/resource/idl__functions.c.em
// with input from ur5_interfaces:srv/Gripper.idl
// generated code does not contain a copyright notice
#include "ur5_interfaces/srv/detail/gripper__functions.h"

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

bool
ur5_interfaces__srv__Gripper_Request__init(ur5_interfaces__srv__Gripper_Request * msg)
{
  if (!msg) {
    return false;
  }
  // width
  return true;
}

void
ur5_interfaces__srv__Gripper_Request__fini(ur5_interfaces__srv__Gripper_Request * msg)
{
  if (!msg) {
    return;
  }
  // width
}

bool
ur5_interfaces__srv__Gripper_Request__are_equal(const ur5_interfaces__srv__Gripper_Request * lhs, const ur5_interfaces__srv__Gripper_Request * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // width
  if (lhs->width != rhs->width) {
    return false;
  }
  return true;
}

bool
ur5_interfaces__srv__Gripper_Request__copy(
  const ur5_interfaces__srv__Gripper_Request * input,
  ur5_interfaces__srv__Gripper_Request * output)
{
  if (!input || !output) {
    return false;
  }
  // width
  output->width = input->width;
  return true;
}

ur5_interfaces__srv__Gripper_Request *
ur5_interfaces__srv__Gripper_Request__create()
{
  ur5_interfaces__srv__Gripper_Request * msg = (ur5_interfaces__srv__Gripper_Request *)malloc(sizeof(ur5_interfaces__srv__Gripper_Request));
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(ur5_interfaces__srv__Gripper_Request));
  bool success = ur5_interfaces__srv__Gripper_Request__init(msg);
  if (!success) {
    free(msg);
    return NULL;
  }
  return msg;
}

void
ur5_interfaces__srv__Gripper_Request__destroy(ur5_interfaces__srv__Gripper_Request * msg)
{
  if (msg) {
    ur5_interfaces__srv__Gripper_Request__fini(msg);
  }
  free(msg);
}


bool
ur5_interfaces__srv__Gripper_Request__Sequence__init(ur5_interfaces__srv__Gripper_Request__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  ur5_interfaces__srv__Gripper_Request * data = NULL;
  if (size) {
    data = (ur5_interfaces__srv__Gripper_Request *)calloc(size, sizeof(ur5_interfaces__srv__Gripper_Request));
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = ur5_interfaces__srv__Gripper_Request__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        ur5_interfaces__srv__Gripper_Request__fini(&data[i - 1]);
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
ur5_interfaces__srv__Gripper_Request__Sequence__fini(ur5_interfaces__srv__Gripper_Request__Sequence * array)
{
  if (!array) {
    return;
  }
  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      ur5_interfaces__srv__Gripper_Request__fini(&array->data[i]);
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

ur5_interfaces__srv__Gripper_Request__Sequence *
ur5_interfaces__srv__Gripper_Request__Sequence__create(size_t size)
{
  ur5_interfaces__srv__Gripper_Request__Sequence * array = (ur5_interfaces__srv__Gripper_Request__Sequence *)malloc(sizeof(ur5_interfaces__srv__Gripper_Request__Sequence));
  if (!array) {
    return NULL;
  }
  bool success = ur5_interfaces__srv__Gripper_Request__Sequence__init(array, size);
  if (!success) {
    free(array);
    return NULL;
  }
  return array;
}

void
ur5_interfaces__srv__Gripper_Request__Sequence__destroy(ur5_interfaces__srv__Gripper_Request__Sequence * array)
{
  if (array) {
    ur5_interfaces__srv__Gripper_Request__Sequence__fini(array);
  }
  free(array);
}

bool
ur5_interfaces__srv__Gripper_Request__Sequence__are_equal(const ur5_interfaces__srv__Gripper_Request__Sequence * lhs, const ur5_interfaces__srv__Gripper_Request__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!ur5_interfaces__srv__Gripper_Request__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
ur5_interfaces__srv__Gripper_Request__Sequence__copy(
  const ur5_interfaces__srv__Gripper_Request__Sequence * input,
  ur5_interfaces__srv__Gripper_Request__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(ur5_interfaces__srv__Gripper_Request);
    ur5_interfaces__srv__Gripper_Request * data =
      (ur5_interfaces__srv__Gripper_Request *)realloc(output->data, allocation_size);
    if (!data) {
      return false;
    }
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!ur5_interfaces__srv__Gripper_Request__init(&data[i])) {
        /* free currently allocated and return false */
        for (; i-- > output->capacity; ) {
          ur5_interfaces__srv__Gripper_Request__fini(&data[i]);
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
    if (!ur5_interfaces__srv__Gripper_Request__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}


bool
ur5_interfaces__srv__Gripper_Response__init(ur5_interfaces__srv__Gripper_Response * msg)
{
  if (!msg) {
    return false;
  }
  // status
  return true;
}

void
ur5_interfaces__srv__Gripper_Response__fini(ur5_interfaces__srv__Gripper_Response * msg)
{
  if (!msg) {
    return;
  }
  // status
}

bool
ur5_interfaces__srv__Gripper_Response__are_equal(const ur5_interfaces__srv__Gripper_Response * lhs, const ur5_interfaces__srv__Gripper_Response * rhs)
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
ur5_interfaces__srv__Gripper_Response__copy(
  const ur5_interfaces__srv__Gripper_Response * input,
  ur5_interfaces__srv__Gripper_Response * output)
{
  if (!input || !output) {
    return false;
  }
  // status
  output->status = input->status;
  return true;
}

ur5_interfaces__srv__Gripper_Response *
ur5_interfaces__srv__Gripper_Response__create()
{
  ur5_interfaces__srv__Gripper_Response * msg = (ur5_interfaces__srv__Gripper_Response *)malloc(sizeof(ur5_interfaces__srv__Gripper_Response));
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(ur5_interfaces__srv__Gripper_Response));
  bool success = ur5_interfaces__srv__Gripper_Response__init(msg);
  if (!success) {
    free(msg);
    return NULL;
  }
  return msg;
}

void
ur5_interfaces__srv__Gripper_Response__destroy(ur5_interfaces__srv__Gripper_Response * msg)
{
  if (msg) {
    ur5_interfaces__srv__Gripper_Response__fini(msg);
  }
  free(msg);
}


bool
ur5_interfaces__srv__Gripper_Response__Sequence__init(ur5_interfaces__srv__Gripper_Response__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  ur5_interfaces__srv__Gripper_Response * data = NULL;
  if (size) {
    data = (ur5_interfaces__srv__Gripper_Response *)calloc(size, sizeof(ur5_interfaces__srv__Gripper_Response));
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = ur5_interfaces__srv__Gripper_Response__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        ur5_interfaces__srv__Gripper_Response__fini(&data[i - 1]);
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
ur5_interfaces__srv__Gripper_Response__Sequence__fini(ur5_interfaces__srv__Gripper_Response__Sequence * array)
{
  if (!array) {
    return;
  }
  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      ur5_interfaces__srv__Gripper_Response__fini(&array->data[i]);
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

ur5_interfaces__srv__Gripper_Response__Sequence *
ur5_interfaces__srv__Gripper_Response__Sequence__create(size_t size)
{
  ur5_interfaces__srv__Gripper_Response__Sequence * array = (ur5_interfaces__srv__Gripper_Response__Sequence *)malloc(sizeof(ur5_interfaces__srv__Gripper_Response__Sequence));
  if (!array) {
    return NULL;
  }
  bool success = ur5_interfaces__srv__Gripper_Response__Sequence__init(array, size);
  if (!success) {
    free(array);
    return NULL;
  }
  return array;
}

void
ur5_interfaces__srv__Gripper_Response__Sequence__destroy(ur5_interfaces__srv__Gripper_Response__Sequence * array)
{
  if (array) {
    ur5_interfaces__srv__Gripper_Response__Sequence__fini(array);
  }
  free(array);
}

bool
ur5_interfaces__srv__Gripper_Response__Sequence__are_equal(const ur5_interfaces__srv__Gripper_Response__Sequence * lhs, const ur5_interfaces__srv__Gripper_Response__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!ur5_interfaces__srv__Gripper_Response__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
ur5_interfaces__srv__Gripper_Response__Sequence__copy(
  const ur5_interfaces__srv__Gripper_Response__Sequence * input,
  ur5_interfaces__srv__Gripper_Response__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(ur5_interfaces__srv__Gripper_Response);
    ur5_interfaces__srv__Gripper_Response * data =
      (ur5_interfaces__srv__Gripper_Response *)realloc(output->data, allocation_size);
    if (!data) {
      return false;
    }
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!ur5_interfaces__srv__Gripper_Response__init(&data[i])) {
        /* free currently allocated and return false */
        for (; i-- > output->capacity; ) {
          ur5_interfaces__srv__Gripper_Response__fini(&data[i]);
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
    if (!ur5_interfaces__srv__Gripper_Response__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}
