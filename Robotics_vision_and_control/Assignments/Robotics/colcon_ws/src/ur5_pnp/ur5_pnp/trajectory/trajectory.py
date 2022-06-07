import numpy as np

# 1st order polynomial trajectory
class FirstOrderPolynomial():

    def __init__(self, dt, qi, qf):
        self.dt = dt
        self.a0 = qi
        self.a1 = (qf - qi) / dt

    def get(self):


# 3rd order polynomial trajectory
class ThirdOrderPolynomial():

    def __init__(self, dt, qi, qf, dqi, dqf):
        pass

# 5th order polynomial trajectory
class FifthOrderPolynomial():

    def __init__(self, dt, qi, qf, dqi, dqf, ddqi, ddqf):
        pass

# 7th order polynomial trajectory
class SeventhOrderPolynomial():

    def __init__(self, dt, qi, qf, dqi, dqf, ddqi, ddqf, dddqi, dddqf):
        pass