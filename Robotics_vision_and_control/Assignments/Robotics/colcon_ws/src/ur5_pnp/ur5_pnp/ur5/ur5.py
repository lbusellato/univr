from rclpy.node import Node
from geometry_msgs.msg import PoseStamped
from ur5_pnp.trajectory.p2p import Polynomial


class UR5(Node):

    def __init__(self) -> None:
        super().__init__('ur5_node')
        
        # Set up logger
        self.logger = self.get_logger()
        self.verbose = False

        # Cartesian controller publisher
        self.ee_target = self.create_publisher(PoseStamped, '/ur5/ee_target/pose', 1)   
        # Test traj
        self.X = 1.0 #Polynomial(0, 1, 0.1, [0.48, 1.5])
        self.Y = 1.0 #Polynomial(0, 1, 0.1, [0.13, 1.13])
        self.Z = 1.0 #Polynomial(0, 1, 0.1, [0.61, 1.61])
        # 10Hz control loop
        self.timer_period = 0.1
        self.timer = self.create_timer(self.timer_period, self.control_loop)


    def control_loop(self):
        r = 0.5
        p = 0.5
        y = 0.5
        w = 0.5
        msg = PoseStamped()
        msg.pose.position.x = self.X
        msg.pose.position.y = self.Y
        msg.pose.position.x = self.Z
        msg.pose.orientation.x = r
        msg.pose.orientation.y = p
        msg.pose.orientation.z = y
        msg.pose.orientation.w = w
        self.ee_target.publish(msg)
        

    def destroy_node(self):
        return super().destroy_node()