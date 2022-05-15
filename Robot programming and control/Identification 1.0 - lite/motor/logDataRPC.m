DATA = csvread(['./data2/' name]);

t = DATA(:,1);
ts = mean(diff(t));

tau = DATA(:,2);
dtheta_m = DATA(:,3);
ddtheta_m = DATA(:,4);

% ddtheta_e = [diff(dtheta_e); 0]/ts;
% ddtheta_m = [diff(dtheta_m); 0]/ts;

half_sampling_freq = 1/(2.*ts);
cut_off_freq = 10; % [Hz]

[B,A] = butter(8,cut_off_freq/half_sampling_freq);

% current = filter(B,A, current);
tau = filter(B,A, tau);
% theta_e = filter(B,A, theta_e);
% dtheta_e = filter(B,A, dtheta_e);
% ddtheta_e = filter(B,A, ddtheta_e);
% theta_m = filter(B,A, theta_m);
dtheta_m = filter(B,A, dtheta_m);
ddtheta_m = filter(B,A, ddtheta_m);

tmp = find(t>startTime);
start_idx = tmp(1);
tmp = find(t>endTime);
if numel(tmp)==0
    end_idx = length(t);
else
    end_idx = tmp(1);
end
 
t = t(start_idx:end_idx);
tau = tau(start_idx:end_idx);
dtheta_m = dtheta_m(start_idx:end_idx);
ddtheta_m = ddtheta_m(start_idx:end_idx);

figure(1)
subplot(3,1,1)
plot(t,tau);
legend("tau")
subplot(3,1,2)
plot(t,dtheta_m);
legend("dtheta_m")
subplot(3,1,3)
plot(t,ddtheta_m);
legend("ddtheta_m")