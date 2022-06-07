from sqlalchemy import true
import rclpy

from rclpy.node import Node
from sensor_msgs.msg import JointState
from std_msgs.msg import Bool
from ur5_interfaces.srv import Gripper                                                           


class GripperService(Node):

    def __init__(self):
        super().__init__('gripper_service_node')
        self.srv = self.create_service(Gripper, 'gripper_service', self.gripper_callback)    
        self.gripperPublisher = self.create_publisher(Bool, '/wsg_50/controller/command', 1)
        self.jointStatesSubscriber = self.create_subscription(JointState, '/joint_states', self.joint_states_callback, rclpy.qos.qos_profile_sensor_data)
        self.actualWidth = 0.0
        self.requestedWidth = 0.0


    def gripper_callback(self, request, response):
        response.status = False
        self.get_logger().info(f"Received gripper request with width: {request.width}")  
        self.requestedWidth = request.width
        response.status = True
        return response

    def joint_states_callback(self, msg):
        self.actualWidth = msg.position[-1]
        msg = Bool()
        print(f"actual:{self.actualWidth} - requested:{self.requestedWidth} -  diff:{abs(self.actualWidth-self.requestedWidth)}")
        if abs(self.actualWidth - self.requestedWidth) > 0.01:
            msg.data = self.requestedWidth < self.actualWidth
            self.gripperPublisher.publish(msg)

def main(args=None):
    rclpy.init(args=args)

    minimal_service = GripperService()

    rclpy.spin(minimal_service)

    rclpy.shutdown()

if __name__ == '__main__':
    main()