function [q,dq,ddq,dddq] = rectilinear(u,du,ddu,dddu,qi,qf)
    % RECTILINEAR Generates the position q, velocity dq, acceleration ddq 
    % and jerk dddq profiles for a rectilinear motion primitive between pi 
    % and pf.
    %
    % [q,dq,ddq,dddq] = rectilinear(u, du, ddu, qi, qf) generates the 
    % rectilinear motion primitive parametrized wrt u, with velocity du 
    % acceleration ddu and jerk dddu, between the points qi and qf.
    %
    % Author: Lorenzo Busellato, 2022

    q = qi + u.*(qf-qi);
    dq = du.*(qf-qi);
    ddq = ddu.*(qf-qi);
    dddq = dddu.*(qf-qi);
end