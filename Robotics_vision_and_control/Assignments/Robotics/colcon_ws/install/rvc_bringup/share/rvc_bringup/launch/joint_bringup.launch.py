import os
from ament_index_python.packages import get_package_share_directory, get_package_share_path
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument, IncludeLaunchDescription
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node
from launch.substitutions import LaunchConfiguration, Command
from launch_ros.descriptions import ParameterValue  # Need master or Galactic branch for this feature
from launch.launch_description_sources import PythonLaunchDescriptionSource

def generate_launch_description():

    package_name = 'kinematic'
    package_dir = get_package_share_directory(package_name)

    fk_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(os.path.join(package_dir, 'launch', 'forward_kinematic.launch.py')))

    ld =  LaunchDescription()


    ld.add_action(fk_launch)


    return ld
