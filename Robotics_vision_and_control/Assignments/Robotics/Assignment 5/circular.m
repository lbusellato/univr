function [q,dq,ddq,dddq] = circular(u,du,ddu,dddu,P,c,r)
    % CIRCULAR Generates the position q, velocity dq, acceleration ddq 
    % and jerk dddq profiles for a circular motion primitive between pi 
    % and pf.
    %
    % [q,dq,ddq,dddq] = circular(u, du, ddu, P, c, r) generates the 
    % rectilinear motion primitive parametrized wrt u, with velocity du 
    % acceleration ddu and jerk dddu, starting from point P and having 
    % center c and radius r.
    %
    % Author: Lorenzo Busellato, 2022

x = P - c;
y = cross(r,x);
R = [x y r];
ro = norm(x);

q = c + R*[ro*cos(u);ro*sin(u); zeros(size(u))];
dq = R*(du.*[-ro*sin(u); ro*cos(u); zeros(size(u))]);
ddq = R*(ddu.*[-ro*sin(u); ro*cos(u); zeros(size(u))] ...
       + du.*[-ro*cos(u); -ro*sin(u); zeros(size(u))]);
dddq = R*(dddu.*[-ro*sin(u); ro*cos(u); zeros(size(u))] ...
         + 2 * ddu.*[-ro*cos(u);-ro*sin(u); zeros(size(u))] ...
       + du.*[ro*sin(u); -ro*cos(u); zeros(size(u))]);

end