function [K,R,t] = krt (P )
%KRT Internal and external parameters from P

[Q,U] = qr(inv(P(1:3, 1:3)));
% enforce negative focal
D = diag(sign(diag(U)).*[-1;-1;1]);
Q = Q*D;  U = D*U;
% fix sign of R
s = det(Q);
R = s*Q';
t = s*U*P(1:3,4);
K =  inv(U./U(3,3));

