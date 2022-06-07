import os
import rclpy

from ur5_pnp.ur5.ur5 import UR5

def main(args = None):
    rclpy.init(args=args)

    # Instantiate the UR5 class
    manipulatorNode = UR5()

    # Spin the node
    rclpy.spin(manipulatorNode)
    
    # Destroy the node explicitly
    manipulatorNode.destroy_node()
    rclpy.shutdown()
    os._exit(os.EX_OK)

if __name__ == "main":
    main()