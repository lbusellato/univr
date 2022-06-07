cmake_minimum_required(VERSION 3.8)
project(kinematic)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(NLopt REQUIRED)
find_package(rclcpp REQUIRED)
find_package(orocos_kdl REQUIRED)
find_package(trac_ik_lib REQUIRED)
# uncomment the following section in order to fill in
# further dependencies manually.
# find_package(<dependency> REQUIRED)


include_directories(
  include
)

add_executable(inverse_kinematic_node src/inverse_kinematic.cpp)
target_include_directories(inverse_kinematic_node PUBLIC  ${NLOPT_INCLUDE_DIRS})
target_link_libraries(inverse_kinematic_node ${NLOPT_LIBRARIES})

add_executable(forward_kinematic_node src/forward_kinematic.cpp)
target_include_directories(forward_kinematic_node PUBLIC  ${NLOPT_INCLUDE_DIRS})
target_link_libraries(forward_kinematic_node ${NLOPT_LIBRARIES})

ament_target_dependencies(inverse_kinematic_node
  ament_cmake
  rclcpp
  orocos_kdl
  std_msgs
  trac_ik_lib
  sensor_msgs
)
ament_target_dependencies(forward_kinematic_node
  ament_cmake
  rclcpp
  orocos_kdl
  std_msgs
  trac_ik_lib
  sensor_msgs
)

install(TARGETS inverse_kinematic_node DESTINATION lib/${PROJECT_NAME})
install(TARGETS forward_kinematic_node DESTINATION lib/${PROJECT_NAME})
install(DIRECTORY include/ DESTINATION include/ )
install(DIRECTORY launch DESTINATION share/${PROJECT_NAME})

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # uncomment the line when a copyright and license is not present in all source files
  #set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # uncomment the line when this package is not in a git repo
  #set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
