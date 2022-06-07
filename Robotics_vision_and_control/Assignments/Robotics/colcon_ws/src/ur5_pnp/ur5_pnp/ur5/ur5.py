from rclpy.node import Node

class UR5(Node):

    def __init__(self, controller) -> None:
        super().__init__('ur5_node')
        
        # Set up logger
        self.logger = self.get_logger()
        self.verbose = False

        # 10Hz control loop
        self.timer_period = 0.1
        self.timer = self.create_timer(self.timer_period, self.control_loop)


    def control_loop(self):
        pass
    

    def destroy_node(self):
        return super().destroy_node()