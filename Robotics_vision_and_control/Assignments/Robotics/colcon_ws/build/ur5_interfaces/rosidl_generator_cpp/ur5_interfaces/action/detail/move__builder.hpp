// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from ur5_interfaces:action/Move.idl
// generated code does not contain a copyright notice

#ifndef UR5_INTERFACES__ACTION__DETAIL__MOVE__BUILDER_HPP_
#define UR5_INTERFACES__ACTION__DETAIL__MOVE__BUILDER_HPP_

#include "ur5_interfaces/action/detail/move__struct.hpp"
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <utility>


namespace ur5_interfaces
{

namespace action
{

namespace builder
{

class Init_Move_Goal_speed
{
public:
  explicit Init_Move_Goal_speed(::ur5_interfaces::action::Move_Goal & msg)
  : msg_(msg)
  {}
  ::ur5_interfaces::action::Move_Goal speed(::ur5_interfaces::action::Move_Goal::_speed_type arg)
  {
    msg_.speed = std::move(arg);
    return std::move(msg_);
  }

private:
  ::ur5_interfaces::action::Move_Goal msg_;
};

class Init_Move_Goal_width
{
public:
  Init_Move_Goal_width()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_Move_Goal_speed width(::ur5_interfaces::action::Move_Goal::_width_type arg)
  {
    msg_.width = std::move(arg);
    return Init_Move_Goal_speed(msg_);
  }

private:
  ::ur5_interfaces::action::Move_Goal msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::ur5_interfaces::action::Move_Goal>()
{
  return ur5_interfaces::action::builder::Init_Move_Goal_width();
}

}  // namespace ur5_interfaces


namespace ur5_interfaces
{

namespace action
{

namespace builder
{

class Init_Move_Result_status
{
public:
  Init_Move_Result_status()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  ::ur5_interfaces::action::Move_Result status(::ur5_interfaces::action::Move_Result::_status_type arg)
  {
    msg_.status = std::move(arg);
    return std::move(msg_);
  }

private:
  ::ur5_interfaces::action::Move_Result msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::ur5_interfaces::action::Move_Result>()
{
  return ur5_interfaces::action::builder::Init_Move_Result_status();
}

}  // namespace ur5_interfaces


namespace ur5_interfaces
{

namespace action
{

namespace builder
{

class Init_Move_Feedback_done
{
public:
  Init_Move_Feedback_done()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  ::ur5_interfaces::action::Move_Feedback done(::ur5_interfaces::action::Move_Feedback::_done_type arg)
  {
    msg_.done = std::move(arg);
    return std::move(msg_);
  }

private:
  ::ur5_interfaces::action::Move_Feedback msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::ur5_interfaces::action::Move_Feedback>()
{
  return ur5_interfaces::action::builder::Init_Move_Feedback_done();
}

}  // namespace ur5_interfaces


namespace ur5_interfaces
{

namespace action
{

namespace builder
{

class Init_Move_SendGoal_Request_goal
{
public:
  explicit Init_Move_SendGoal_Request_goal(::ur5_interfaces::action::Move_SendGoal_Request & msg)
  : msg_(msg)
  {}
  ::ur5_interfaces::action::Move_SendGoal_Request goal(::ur5_interfaces::action::Move_SendGoal_Request::_goal_type arg)
  {
    msg_.goal = std::move(arg);
    return std::move(msg_);
  }

private:
  ::ur5_interfaces::action::Move_SendGoal_Request msg_;
};

class Init_Move_SendGoal_Request_goal_id
{
public:
  Init_Move_SendGoal_Request_goal_id()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_Move_SendGoal_Request_goal goal_id(::ur5_interfaces::action::Move_SendGoal_Request::_goal_id_type arg)
  {
    msg_.goal_id = std::move(arg);
    return Init_Move_SendGoal_Request_goal(msg_);
  }

private:
  ::ur5_interfaces::action::Move_SendGoal_Request msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::ur5_interfaces::action::Move_SendGoal_Request>()
{
  return ur5_interfaces::action::builder::Init_Move_SendGoal_Request_goal_id();
}

}  // namespace ur5_interfaces


namespace ur5_interfaces
{

namespace action
{

namespace builder
{

class Init_Move_SendGoal_Response_stamp
{
public:
  explicit Init_Move_SendGoal_Response_stamp(::ur5_interfaces::action::Move_SendGoal_Response & msg)
  : msg_(msg)
  {}
  ::ur5_interfaces::action::Move_SendGoal_Response stamp(::ur5_interfaces::action::Move_SendGoal_Response::_stamp_type arg)
  {
    msg_.stamp = std::move(arg);
    return std::move(msg_);
  }

private:
  ::ur5_interfaces::action::Move_SendGoal_Response msg_;
};

class Init_Move_SendGoal_Response_accepted
{
public:
  Init_Move_SendGoal_Response_accepted()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_Move_SendGoal_Response_stamp accepted(::ur5_interfaces::action::Move_SendGoal_Response::_accepted_type arg)
  {
    msg_.accepted = std::move(arg);
    return Init_Move_SendGoal_Response_stamp(msg_);
  }

private:
  ::ur5_interfaces::action::Move_SendGoal_Response msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::ur5_interfaces::action::Move_SendGoal_Response>()
{
  return ur5_interfaces::action::builder::Init_Move_SendGoal_Response_accepted();
}

}  // namespace ur5_interfaces


namespace ur5_interfaces
{

namespace action
{

namespace builder
{

class Init_Move_GetResult_Request_goal_id
{
public:
  Init_Move_GetResult_Request_goal_id()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  ::ur5_interfaces::action::Move_GetResult_Request goal_id(::ur5_interfaces::action::Move_GetResult_Request::_goal_id_type arg)
  {
    msg_.goal_id = std::move(arg);
    return std::move(msg_);
  }

private:
  ::ur5_interfaces::action::Move_GetResult_Request msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::ur5_interfaces::action::Move_GetResult_Request>()
{
  return ur5_interfaces::action::builder::Init_Move_GetResult_Request_goal_id();
}

}  // namespace ur5_interfaces


namespace ur5_interfaces
{

namespace action
{

namespace builder
{

class Init_Move_GetResult_Response_result
{
public:
  explicit Init_Move_GetResult_Response_result(::ur5_interfaces::action::Move_GetResult_Response & msg)
  : msg_(msg)
  {}
  ::ur5_interfaces::action::Move_GetResult_Response result(::ur5_interfaces::action::Move_GetResult_Response::_result_type arg)
  {
    msg_.result = std::move(arg);
    return std::move(msg_);
  }

private:
  ::ur5_interfaces::action::Move_GetResult_Response msg_;
};

class Init_Move_GetResult_Response_status
{
public:
  Init_Move_GetResult_Response_status()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_Move_GetResult_Response_result status(::ur5_interfaces::action::Move_GetResult_Response::_status_type arg)
  {
    msg_.status = std::move(arg);
    return Init_Move_GetResult_Response_result(msg_);
  }

private:
  ::ur5_interfaces::action::Move_GetResult_Response msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::ur5_interfaces::action::Move_GetResult_Response>()
{
  return ur5_interfaces::action::builder::Init_Move_GetResult_Response_status();
}

}  // namespace ur5_interfaces


namespace ur5_interfaces
{

namespace action
{

namespace builder
{

class Init_Move_FeedbackMessage_feedback
{
public:
  explicit Init_Move_FeedbackMessage_feedback(::ur5_interfaces::action::Move_FeedbackMessage & msg)
  : msg_(msg)
  {}
  ::ur5_interfaces::action::Move_FeedbackMessage feedback(::ur5_interfaces::action::Move_FeedbackMessage::_feedback_type arg)
  {
    msg_.feedback = std::move(arg);
    return std::move(msg_);
  }

private:
  ::ur5_interfaces::action::Move_FeedbackMessage msg_;
};

class Init_Move_FeedbackMessage_goal_id
{
public:
  Init_Move_FeedbackMessage_goal_id()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_Move_FeedbackMessage_feedback goal_id(::ur5_interfaces::action::Move_FeedbackMessage::_goal_id_type arg)
  {
    msg_.goal_id = std::move(arg);
    return Init_Move_FeedbackMessage_feedback(msg_);
  }

private:
  ::ur5_interfaces::action::Move_FeedbackMessage msg_;
};

}  // namespace builder

}  // namespace action

template<typename MessageType>
auto build();

template<>
inline
auto build<::ur5_interfaces::action::Move_FeedbackMessage>()
{
  return ur5_interfaces::action::builder::Init_Move_FeedbackMessage_goal_id();
}

}  // namespace ur5_interfaces

#endif  // UR5_INTERFACES__ACTION__DETAIL__MOVE__BUILDER_HPP_
