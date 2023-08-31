MANU2478 -  Practical Assessment 2
Course: Advanced Robotics. 
Nguyen Tien Thanh - S3818111
Exercise 2 (Cont)
clearvars
close all
clc
Via point
Via point parameters
disp('Via point')
% input parameters
t0=0; t1 =1; t2=1;
u0=60; uf=30; uvia=120;
udot0=0; udotf=0;
Plot the graph
Get parameter for cubic function
% User defined function to calculate a0 a1 a2 a3 parameter for each segment
[a0_seg1,a1_seg1,a2_seg1,a3_seg1,a0_seg2,a1_seg2,a2_seg2,a3_seg2]=cubic_via(t1,u0,uf,uvia);

Derive function to get velocity acceleration and jerk
% Range for t 1s of 2 segment from 0->t1 and 0->t2 (t1=t2)
t = linspace(0,t1);
% Function derivative for the first half (t1) from 0 to 1s
seg1=a3_seg1*t.^3 + a2_seg1*t.^2 + a1_seg1*t + a0_seg1;
seg1_dot=3*a3_seg1*t.^2 + 2*a2_seg1*t + a1_seg1;
seg1_ddot=6*a3_seg1*t + 2*a2_seg1;
seg1_tdot=6*a3_seg1;
% Function derivative for the second half (t2) from 1s to 2s
seg2=a3_seg2*t.^3 + a2_seg2*t.^2 + a1_seg2*t + a0_seg2;
seg2_dot=3*a3_seg2*t.^2 + 2*a2_seg2*t + a1_seg2;
seg2_ddot=6*a3_seg2*t + 2*a2_seg2;
seg2_tdot=6*a3_seg2;
Range time for first and second half of the graph
% Time for 1st segment from 0->t1
t_seg = linspace(t0,t1);
% Time for 2st segment from t1->t2
t_via = linspace(t2,t1+t2);
Position
% position
% Subplot to put graph verically
subplot(4,1,1);
% plots the graph
plot(t_seg, seg1);
title('angular position');
ylabel('s');
xlabel('t (seconds)');
grid on;
% Draw another line same graph
hold on
% plot via point
plot(t_via, seg2);
% Title label and grid the graph
title('angular position');
ylabel('s');
xlabel('t (seconds)');
grid on;
hold off
Velocity
% velocity
% Subplot to put graph verically
subplot(4,1,2);
% plots the graph
plot(t_seg, seg1_dot);
title('angular velocity');
ylabel('ds/dt');
xlabel('t (seconds)');
grid on;
% Draw another line same graph
hold on
% plots via point
plot(t_via, seg2_dot);
% Title label and grid the graph
title('angular velocity');
ylabel('ds/dt');
xlabel('t (seconds)');
grid on;
hold off
Acceleration
% acceleration
% Subplot to put graph verically
subplot(4,1,3);
% plots the graph
plot(t_seg, seg1_ddot);
ylabel('ds^2/dt^2');
xlabel('t (seconds)');
title('angular acceleration');
grid on;
% Draw another line same graph
hold on
% plots via point
plot(t_via, seg2_ddot);
% Title label and grid the graph
ylabel('ds^2/dt^2');
xlabel('t (seconds)');
title('angular acceleration');
grid on;
hold off
Jerk
% jerk
subplot(4,1,4);
% plots the graph
plot(t_seg, polyval(seg1_tdot,t_seg))
ylabel('ds^3/dt^3');
xlabel('t (seconds)');
title('angular jerk');
grid on;
% Draw another line same graph
hold on
% plots via point
plot(t_via, polyval(seg2_tdot,t_via));
% Title label and grid the graph
ylabel('ds^3/dt^3');
xlabel('t (seconds)');
title('angular jerk');
grid on;
hold off

function [a10,a11,a12,a13,a20,a21,a22,a23]=cubic_via(tf,u0,uf,uvia)
a10=u0;
a11=0;
a12=(12*uvia-3*uf-9*u0)/(4*tf^2);
a13=(-8*uvia+3*uf+5*u0)/(4*tf^3);
a20=uvia;
a21=(3*uf-3*u0)/(4*tf);
a22=(-12*uvia+6*uf+6*u0)/(4*tf^2);
a23=(8*uvia-5*uf-3*u0)/(4*tf^3);
end

