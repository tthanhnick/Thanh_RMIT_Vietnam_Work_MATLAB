%MANU2478 -  Practical Assessment 2
%Course: Advanced Robotics. 
%Nguyen Tien Thanh - S3818111
clearvars
close all
clc

%Problem 2
%Cubic polynomial
%Cubic parameter and also quintic parameter
disp('Problem 2')
% input parameters
t0=0; tf =1;
u0=120; uf=60;
udot0=0; udotf=0;
uddot0=0; uddotf=0;
Cubic polynomial calculation
disp('Cubic polynomial')
% User defined function to calculate a0 a1 a2 a3 parameter
[a0, a1, a2, a3]=cubic(tf,u0,uf);
Plot the graph
%Position
% position
% Subplot to put graph verically
subplot(4,1,1);
% Range the time from 0 to 1s
t = linspace(t0,tf);
% Cubic function
u = [a3, a2, a1, a0];
% plots the graph
plot(t, polyval(u,t));
% Title label and grid the graph
title('angular position');
ylabel('s');
xlabel('t (seconds)');
grid on;
%Velocity
% velocity
% Subplot to put graph verically
subplot(4,1,2);
% Cubic function derivative
udot = [3*a3, 2*a2, a1];
% plots the graph
plot(t, polyval(udot,t));
% Title label and grid the graph
title('angular velocity');
ylabel('ds/dt');
xlabel('t (seconds)');
grid on;
%Acceleration 
% acceleration
% Subplot to put graph verically
subplot(4,1,3);
% Cubic function derivative
uddot = [6*a3, 2*a2];
% plots the graph
plot(t, polyval(uddot,t))
% Title label and grid the graph
ylabel('ds^2/dt^2');
xlabel('t (seconds)');
title('angular acceleration');
grid on;
%Jerk
% jerk
% Subplot to put graph verically
subplot(4,1,4);
% Cubic function derivative
utdot = 6*a3;
% plots the graph
plot(t, polyval(utdot,t))
% Title label and grid the graph
ylabel('ds^3/dt^3');
xlabel('t (seconds)');
title('angular jerk');
grid on;

%%Quintic polynomial
%Plot the graph
%Quintic polynomial calculation
% User defined function to calculate a0 a1 a2 a3 parameter
disp('Quintic polynomial')
[a0, a1, a2, a3,a4,a5]=quintic(tf,u0,uf,udot0,udotf,uddot0,uddotf);
%Position
% position
% Subplot to put graph verically
subplot(4,1,1);
% Range the time from 0 to 1s
t = linspace(t0,tf);
% Cubic function
u = [a5, a4, a3, a2, a1, a0];
% plots the graph
plot(t, polyval(u,t));
% Title label and grid the graph
title('angular position');
ylabel('s');
xlabel('t (seconds)');
grid on;
%Velocity
% velocity
% Subplot to put graph verically
subplot(4,1,2);
% Cubic function derivative
udot = [5*a5, 4*a4, 3*a3, 2*a2, a1];
% plots the graph
plot(t, polyval(udot,t));
% Title label and grid the graph
title('angular velocity');
ylabel('ds/dt');
xlabel('t (seconds)');
grid on;
%Acceleration
% acceleration
% Subplot to put graph verically
subplot(4,1,3);
% Cubic function derivative
uddot = [20*a5, 12*a4, 6*a3, 2*a2];
% plots the graph
plot(t, polyval(uddot,t));
ylabel('ds^2/dt^2');
xlabel('t (seconds)');
title('angular acceleration');
grid on;
%Jerk
% jerk
% Subplot to put graph verically
subplot(4,1,4);
% Cubic function derivative
utdot = [60*a5, 24*a4, 6*a3];
% plots the graph
plot(t, polyval(utdot,t))
% Title label and grid the graph
ylabel('ds^3/dt^3');
xlabel('t (seconds)');
title('angular jerk');
grid on;

function [a0, a1, a2, a3]=cubic(tf,u0,uf)
a0=u0;
a1=0;
a2=3/(tf^2)*(uf-u0);
a3=-2/(tf^3)*(uf-u0);
end

function [a0, a1, a2, a3,a4,a5]=quintic(tf,u0,uf,udot0,udotf,uddot0,uddotf)
a0=u0;
a1=udot0;
a2=uddot0/2;
a3=(20*uf-20*u0-(8*udotf+12*udot0)*tf-(3*uddot0-uddotf)*tf^2)/(2*tf^3);
a4=(30*u0-30*uf+(14*udotf+16*udot0)*tf+(3*uddot0-2*uddotf)*tf^2)/(2*tf^4);
a5=(12*uf-12*u0-(6*udotf+6*udot0)*tf-(uddot0-uddotf)*tf^2)/(2*tf^5);
end
