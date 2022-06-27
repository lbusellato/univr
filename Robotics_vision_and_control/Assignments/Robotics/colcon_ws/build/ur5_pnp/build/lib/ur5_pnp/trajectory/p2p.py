import numpy as np

# This class implements polynomial point-to-point trajectory generation.
#
# Author: Lorenzo Busellato, 2022

class Polynomial():

    def __init__(self, ti, tf, dt, q):
        # Arguments check
        if tf < ti:
            # We can't go back in time (yet)
            raise Exception("tf must be higher than ti.")
        if dt < 0:
            # We need a positive sampling time
            dt = dt * -1
        elif dt == 0:
            # We need a sampling time
            dt = 0.001
        elif len(q)%2 != 0:
            # We need both initial and final conditions
            raise Exception("Initial/final conditions must come in pairs.")
        
        # Time series
        self.T = self.normalize(np.arange(ti, tf + dt, dt))
        # Polynomial order
        self.order = int(len(q) / 2)
        # Computation of the polynomial coefficients
        n = len(q)
        H = np.zeros([n, n])
        P = np.ones([n])
        # H is the matrix of the numeric multipliers to the a coefficients
        for i in range(self.order):
            H[i * 2, n - 1 + i] = P[-1]
            H[i * 2 + 1, 0:n - 1] = P
            P = np.polyder(P)
        # The a coefficients are the solutions to the linear system Hq = 0
        self.a = np.linalg.solve(H, q)

    def compute(self):
        q = np.array(self.T.shape)
        for i in range(self.T.shape):
            q[i] = self.a[3] * self.T[i]**3 + self.a[2] * self.T[i]**2 + self.a[1] * self.T[i] + self.a[0]
            if self.order == 5:
                q[i] += self.a[5] * self.T[i]**5 + self.a[4] * self.T[i]**4
            if self.order == 7:
                q[i] += self.a[7] * self.T[i]**7 + self.a[6] * self.T[i]**6
        return q

    def normalize(self, T):
        # Normalize array into [0:dt:1] range
        T = (T - np.min(T))
        return T / np.max(T)