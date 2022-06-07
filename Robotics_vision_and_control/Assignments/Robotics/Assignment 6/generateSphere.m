function S = generateSphere(P0, R, n)
    % GENERATESPHERE Computes the 3D coordinates of a sphere.
    %
    %   S = GENERATESPHERE(P0, R) generates a struct S containing the X, Y
    %   and Z coordinates of the points of a sphere with radius R and
    %   center P0.
    %
    %   S = GENERATESPHERE(P0, R, n) generates a struct S containing the X,
    %   Y and Z coordinates of the points of a sphere, with radius R and
    %   center P0, made up of n polygonal faces.
    %
    %   Author: Lorenzo Busellato, 2022
    arguments
        P0 (1,3) double 
        R (1,:) double
        n (1,:) double = 50
    end
    [X1, Y1, Z1] = sphere(n);
    S.X = (R*X1)+P0(1,1);
    S.Y = (R*Y1)+P0(1,2);
    S.Z = (R*Z1)+P0(1,3);
end