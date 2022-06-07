import os
from ament_index_python.packages import get_package_share_directory, get_package_share_path
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node
from launch.substitutions import LaunchConfiguration, Command
from launch_ros.descriptions import ParameterValue  # Need master or Galactic branch for this feature

def generate_launch_description():

    path_to_urdf = get_package_share_path('ur5_description') / 'urdf' / 'robot' / 'ur5_wsg50.urdf.xacro'

    inverse_kinematic_node = Node(
        package='kinematic',
        executable='inverse_kinematic_node',
        parameters=[{
            'robot_description': ParameterValue(
                Command(['xacro ', str(path_to_urdf)]), value_type=str
            )
        }]
    )

    ld =  LaunchDescription()


    ld.add_action(inverse_kinematic_node)


    return ld
