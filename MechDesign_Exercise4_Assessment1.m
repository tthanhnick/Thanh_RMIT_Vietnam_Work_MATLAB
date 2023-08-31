%% Calculate the position angular velocity and acceleration
%Call the variables
syms theta3 theta4;%Angle
syms omega3 omega4; %Angular velocity
syms alpha3 alpha4;%Angular acceleration
%Calculate the system of non linear equations for the position
eqn1 = 0.72*cos(30/180*pi)+0.68*cos(theta3)-0.85*cos(theta4)-1.82;
eqn2 = 0.72*sin(30/180*pi)+0.68*sin(theta3)-0.85*sin(theta4);
sol=solve(eqn1,eqn2);
theta3=double(sol.theta3);
theta4=double(sol.theta4);
%Display the position result in rad and deg
disp("Position") %Take the first result of theta 3 and 4
disp(rad2deg(theta3(1)))
disp(rad2deg(theta4(1)))
disp("Angular Position") %Take the first result of theta 3 and 4
disp(theta3(1))
disp(theta4(1))

%Calculate the system of non linear equations for the first angular velocity
eqn3 = -0.72*15*sin(30/180*pi)-0.68*omega3*sin(theta3(1))+0.85*omega4*sin(theta4(1));
eqn4 = 0.72*15*cos(30/180*pi)+0.68*omega3*cos(theta3(1))-0.85*omega4*cos(theta4(1));
sol=solve(eqn3,eqn4);
omega3=double(sol.omega3);
omega4=double(sol.omega4);
%Display the result of the angular velocity
disp("Angular Velocity")
disp(omega3)
disp(omega4)

%Calculate the system of non linear equations for the angular acceleration
eqn7 = -0.72*(-10)*sin(30/180*pi)-0.72*(15^2)*cos(30/180*pi)-0.68*alpha3*sin(theta3(1))-0.68*(omega3^2)*cos(theta3(1))+0.85*alpha4*sin(theta4(1))+0.85*(omega4^2)*cos(theta4(1));
eqn8 = 0.72*(-10)*cos(30/180*pi)-0.72*(15^2)*sin(30/180*pi)+0.68*alpha3*cos(theta3(1))-0.68*(omega3^2)*sin(theta3(1))-0.85*alpha4*cos(theta4(1))+0.85*(omega4^2)*sin(theta4(1));
sol=solve(eqn7,eqn8);
alpha3=double(sol.alpha3);
alpha4=double(sol.alpha4);
%Display the result of the angular acceleration
disp("Angular acceleration")
disp(alpha3)
disp(alpha4)
%% Calculate Four bar linkage using matrix
A=[1,0,1,0,0,0,0,0,0;0,1,0,1,0,0,0,0,0;0.18,-0.312,-0.18,0.312,0,0,0,0,1;0,0,-1,0,1,0,0,0,0;0,0,0,-1,0,1,0,0,0;0,0,-0.405,0.279,0.316,0.345,0,0,0;0,0,0,0,-1,0,1,0,0;0,0,0,0,0,-1,0,1,0;0,0,0,0,0.314,0.286,0.314,0.286,0]; %Matrix A
t=[-966.01;-586.723;-3.03;-3004.184;-4231.008;-340.262;-1095.643;-1019.672;212.657]; %Matrix result
y=A\t;% inv(A)*t %Reverse Matrix A* Matrix result
disp(y)%Result