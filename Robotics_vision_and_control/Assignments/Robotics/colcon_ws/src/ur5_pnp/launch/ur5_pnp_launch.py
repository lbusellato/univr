from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='ur5_pnp',
            namespace='ur5_pnp',
            executable='main',
            name='ur5'
        ),
    ])