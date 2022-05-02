from LBO import *
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import pyplot as plt
import numpy as np

def read_off(file):
    import numpy as np
    f=file.readline().strip()
    n_verts, n_faces, n_dontknow = tuple([int(s) for s in file.readline().strip().split(' ')])
    verts = [[float(s) for s in file.readline().strip().split(' ')] for i_vert in range(n_verts)]
    faces = [[int(s) for s in file.readline().strip().split(' ')][1:] for i_face in range(n_faces)]
    return np.asarray(verts), faces

def obtain_features(m1_v, m1_f, n):
    from scipy.sparse.linalg import eigsh
    SrcW, Area1 = computeAB(m1_v, m1_f)
    SrcEV, SrcLB = eigsh(SrcW, n, Area1, sigma=0.0, which='LM')
    return SrcLB


def plot_shape(m1_v,labels):
  fig = plt.figure(figsize=(10,10))
  ax = Axes3D(fig, azim=-90, elev=90)
  ax.scatter(m1_v[:,0],m1_v[:,1],m1_v[:,2],c=labels)
  ax.auto_scale_xyz([-1, 1], [-1,1], [0,1])