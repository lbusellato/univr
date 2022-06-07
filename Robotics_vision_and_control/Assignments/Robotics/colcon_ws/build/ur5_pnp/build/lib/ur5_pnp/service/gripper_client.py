from rclpy.node import Node
from ur5_interfaces.srv import Gripper

class GripperClient(Node):

    def __init__(self):
        super().__init__('gripper_client_node')
        self.cli = self.create_client(Gripper, 'gripper_service')       
        while not self.cli.wait_for_service(timeout_sec=1.0):
            self.get_logger().info('service not available, waiting again...')
        print('Connected to service')
        self.req = Gripper.Request()                                   

    def send_request(self, width):
        self.req.width = width
        self.future = self.cli.call_async(self.req)