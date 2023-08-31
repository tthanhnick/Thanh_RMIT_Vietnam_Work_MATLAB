%MANU2478 -  Practical Assessment 2
%Course: Advanced Robotics. 
%Nguyen Tien Thanh - S3818111
clearvars
close all
clc
%%Ex1 (Cont)- Langrarian
% geometry parameters and masses
syms g L1 L2 m1 m2 
P12=[L1;0;0];
P23=[L2;0;0];
g0_trans=[0 0 -g];

% joint angles, velocities and accelerations (symbolic variables)
syms c1 s1 c2 s2 theta_1 theta_2 theta_dot1 theta_dot2
syms theta_ddot1 theta_ddot2 uref1 uref2

% rotation matrices between successive links 
R10 = [c1 s1 0; -s1 c1 0; 0 0 1]; 
R21 = [c2 0 s2; -s2 0 c2; 0 -1 0]; 
R23 = eye(3); % frames {2} and {3} have the same orientation
%Parameter of kinetic energy
% We start with
% The outward interations for link 1
omega11     = [0; 0; theta_dot1]
v11=[0;0;0]
% The outward interations for link 2
omega22 = R21*omega11 + theta_dot2*[0;0;1]
v22=R21*(cross(omega11,P12))
% The outward interations for end effector
v33=R23'*(v22+cross(omega22,P23))
% The interations for at center of mass
v2c1=v22;
v2c1_trans=[v2c1(1,1) v2c1(2,1) v2c1(3,1)];
v3c2=v33;
v3c2_trans=[v3c2(1,1) v3c2(2,1) v3c2(3,1)];
omega1c1=omega11;
omega2c2=omega22;
%Kinetic energy calculation
k=1/2*m1*v2c1_trans*v2c1+1/2*m2*v3c2_trans*v3c2
%Parameter of potential energy
% rotation matrices between successive links 
R01 = [c1 -s1 0 0;s1 c1 0 0;0 0 1 0;0 0 0 1];
R12 = [c2 -s2 0 0;0 0 -1 0;s2 c2 0 0;0 0 0 1];
R23=eye(4); % frames {2} and {3} have the same orientation
% transformation matrices between successive links 
T01=transl(0,0,0)*R01;
T12=transl(L1,0,0)*R12;
T23=transl(L2,0,0)*R23;
T02=T01*T12;
T03=T01*T12*T23;
% geometry parameters at the center of mass
P0C1=[T02(1,4);T02(2,4);T02(3,4)]
P0C2=[T03(1,4);T03(2,4);T03(3,4)]
%Potential energy calculation
u=-m1*g0_trans*P0C1+uref1-m2*g0_trans*P0C2+uref2
%Partial derivative
% Kinetic and potential energy for derivative
KE=(m2*(L1*theta_dot1 + L2*cos(theta_2)*theta_dot1)^2)/2 + ...
    (L1^2*m1*theta_dot1^2)/2 + (L2^2*m2*theta_dot2^2)/2
PE=L2*g*m2 + L2*g*m2*sin(theta_2)
% Demonstrate the partial derivative process and add the theta_dot after
deltak_thetadot1=diff(KE,theta_dot1)
deltak_thetadot2=diff(KE,theta_dot2)
deltak_theta1=diff(KE,theta_1)
deltak_theta2=diff(KE,theta_2)
deltau_theta1=diff(PE,theta_1)
deltau_theta2=diff(PE,theta_2)
%Due to MATLAB constraint we need to derive theta_dot after that
% Derive theta_dot since matlab partial derivative not able to do so
r11_dd=m2*(L1*theta_ddot1 + L2*c2*theta_ddot1)*(L1*theta_dot1 + L2*theta_dot1*c2) +... 
           L1^2*m1*theta_ddot1
r12_dd=L2^2*m2*theta_ddot2
r11_d=0
r12_d=-L2*m2*theta_dot1*s2*(L1*theta_dot1 + L2*theta_dot1*c2)
r11_u=0
r12_u=L2*g*m2*c2
% Tau calculation based on langragian formulation
Tau=[r11_dd;r12_dd]-[r11_d;r12_d]...
+ [r11_u;r12_u]
Tau1=Tau(1,1)
Tau2=Tau(2,1)
%Simplification
% Simplification of each torque
T1=simplifyFraction(Tau(1,1))
T2=simplifyFraction(Tau(2,1))
