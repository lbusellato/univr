import os
from ament_index_python.packages import get_package_share_directory, get_package_share_path
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node
from launch.substitutions import LaunchConfiguration, Command
from launch_ros.descriptions import ParameterValue  # Need master or Galactic branch for this feature

def generate_launch_description():

    use_sim_time = LaunchConfiguration('use_sim_time', default='false')

    use_sim_time_param = DeclareLaunchArgument(
        'use_sim_time',
        default_value='false',
        description='Use simulation (Gazebo) clock if true')

    path_to_urdf = get_package_share_path('ur5_description') / 'urdf' / 'robot' / 'ur5_wsg50.urdf.xacro'
    robot_state_publisher_node = Node(
        package='robot_state_publisher',
        executable='robot_state_publisher',
        parameters=[{
            'robot_description': ParameterValue(
                Command(['xacro ', str(path_to_urdf)]), value_type=str
            )
        }]
    )

    joint_states_node = Node(
        package='joint_state_publisher_gui',
        executable='joint_state_publisher_gui',
        name='joint_state_publisher_gui'
    )

    rviz_node = Node(
        package='rviz2',
        executable='rviz2',
        output='screen',
        arguments=['-d', os.path.join(get_package_share_path('ur5_description'), 'rviz', 'ur5_rviz.rviz')],
    )

    ld =  LaunchDescription()

    ld.add_action(use_sim_time_param)
    ld.add_action(robot_state_publisher_node)
    ld.add_action(joint_states_node)
    ld.add_action(rviz_node)

    return ld


# https://github.com/astemeric/ur5_unity_ik
# https://github.com/qian256/ur5_unity