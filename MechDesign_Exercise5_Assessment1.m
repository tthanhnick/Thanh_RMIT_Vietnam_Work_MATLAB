%% Calculate the position angular velocity and acceleration
%Call the variables
syms theta3 theta4;
%Calculate the system of non linear equations for the position
eqn1 = 0.075*cos(330/180*pi)+0.3*cos(theta3)-0.2*cos(theta4)-0.4;
eqn2 = 0.075*sin(330/180*pi)+0.3*sin(theta3)-0.2*sin(theta4);
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
%% Calculate Four bar linkage using matrix
A=[1,0,1,0,0,0,0,0,0;0,1,0,1,0,0,0,0,0;-0.019,-0.032,0.019,0.32,0,0,0,0,1;0,0,-1,0,1,0,0,0,0;0,0,0,-1,0,1,0,0,0;0,0,-0.086,0.138,-0.116,0.084,0,0,0;0,0,0,0,-1,0,1,0,0;0,0,0,0,0,-1,0,1,0;0,0,0,0,0.082,0.057,0.082,0.057,0]; %Matrix A
t=[0;0;0;-1446.447;-353.553;200.668;-1800;0;147.6]; %Matrix result
y=A\t;% inv(A)*t %Reverse Matrix A* Matrix result
disp(y)%Result