%clearvars;
close all;
clc;

set(cstprefs.tbxprefs,'FrequencyUnits','Hz')
s = tf([1 0],1);

% maxon EC90 with ratio 1:1
%r = 1;
%Kt = 0.0705*r; % Equal to Kv = 1/(2*pi*135/60)*r
Im = 0.1564; % w/o weight %0.2244; w/ weight % 0.0003*r^2; % Jm, inertia of the motor
Fm = 0.2296; % w/o weight %0.0603; w/ weight % dm, friction coefficient
%Ra = 0.343; % Resistance of the coils
%La = 0.000264; % Inductance of the coils

s = tf([1 0],1);

%El = 1 / (s*La + Ra); % Electrical part
Me =  1 / (s*(s*Im + Fm)); % Mechanical part

Gi = feedback(Me,1)
%Gi = El / (1 + Kt^2*Me*El); % Transfer function
%Gi = minreal(Gi) % Simplify poles and zeros if possible

sisotool(Me)

%margin(C*G) per bode per phase margin e banda