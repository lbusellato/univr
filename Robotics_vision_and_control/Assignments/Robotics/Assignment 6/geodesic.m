function [G, F] = geodesic(P1, P2, P0, du)
    
    % Compute the radius
    R0 = norm(P1 - P0);
    % Compute the radius vector for the two points
    R1 = (P1 - P0) / R0;
    R2 = (P2 - P0) / R0;
    % Compute the direction of the circle connecting P1 and P2
    R = cross(R1, R2);
    R = R/norm(R);
    % Collect three directions
    Rt = [R1 cross(R, R1) R];
    % Compute rotations
    Ri = [cross(R, -R1) R -R1];
    Rf = [cross(R, -R2) R -R2];
    Rif = Ri'*Rf;
    % Angle from P1 to P2
    uf = acos((trace(Rif) - 1) / 2);
    % Rotation axis
    r = [Rif(3, 2) - Rif(2, 3);
         Rif(1, 3) - Rif(3, 1);
         Rif(2, 1) - Rif(1, 2)] / (2 * sin(uf));
    % Compute the points from P1 to P2
    u = 0:du:uf;
    G = Rt * [R0 * cos(u);
              R0 * sin(u);
              zeros(size(u))] + P0;
    G = G';
    % Compute the Frenet frame associated to each point
    Ru = times3(r*r',1-cos(u)) + times3(skew(r),sin(u)) + times3(eye(3),cos(u));
    F = zeros(size(Ru));
    for i=1:size(Ru,3)
        F(:,:,i) = Ri*Ru(:,:,i);
    end
    
    
    
end
function [S] = skew(s)
S = [    0 -s(3)  s(2); 
      s(3)     0 -s(1); 
     -s(2)  s(1)     0];
end

function [T] = times3(M,v)
% matrix-by-vector multiplication over the third axis
T = bsxfun(@times,M,reshape(v,1,1,[]));
end