function [T,q,dq,ddq,dddq] = linearPoly(ts,ti,tf,qi,qf)
    % LINEARPOLY Computes the linear interpolation of position, velocity,
    % acceleration and jerk between the points qi and qf.
    %
    % [T,q,dq,ddq,dddq] = linearPoly(ts,ti,tf,qi,qf)
    %
    % Author: Lorenzo Busellato, 2022

    DQ = qf - qi;
    DT = tf - ti;
    % Compute the interpolation coefficients
    a0 = qi;
    a1 = DQ / DT;
    % Generate the profiles
    T = 0:ts:DT;
    q = a0 + a1*T;
    dq = a1 * ones(size(T));
    ddq = zeros(size(T));
    dddq = zeros(size(T));
    
    T = ti + T; % Consider the initial time
end