%% Question3a
%Call the variables
syms in theta2 theta3 theta4;%Angle
theta2=input("Input angle");
%Calculate the system of non linear equations for the position
eqn1 = 0.3*cos(theta2/180*pi)+0.36*cos(theta3)-0.36*cos(theta4)-0.6;
eqn2 = 0.3*sin(theta2/180*pi)+0.36*sin(theta3)-0.36*sin(theta4);
sol=solve(eqn1,eqn2);
theta3=double(sol.theta3);%Theta3 result
theta4=double(sol.theta4);%Theta4 result
%Display the position result
disp("Angle of the BP2P1")
disp(180-rad2deg(theta4(1))) %Angle of the BP2P1
%% Question3b
syms theta_2 theta_4 output; %Angle
syms trajectory_Ax trajectory_Ay trajectory_Bx trajectory_By;
theta_2=0:1:180;
a=0.3; b=0.36; c=0.36; d=0.6;
k1=d/a; k2=d/c; k3=(a^2-b^2+c^2+d^2)/(2*a*c);
%From Freudenstein equation we got
A=cos(theta_2/180*pi)-k1-k2*cos(theta_2/180*pi)+k3;
B=-2*sin(theta_2/180*pi);
C=k1-(k2+1)*cos(theta_2/180*pi)+k3;
theta_4=2*atan((-B-sqrt(B.^2-4.*A.*C))./(2.*A));
output=180-rad2deg(theta_4);
%Trajectories of 2 point A and B
trajectory_Ax=0.3*cos(theta_2/180*pi);
trajectory_Ay=0.3*sin(theta_2/180*pi);
trajectory_Bx=0.36*cos(theta_4);
trajectory_By=0.36*sin(theta_4);
%Plot Graph 1
figure(1) %figure's name
plot(theta_2,output) %plot the data with BP2P1 respected to AP1P2
xlabel('AP1P2 (degree)'); %label x axis to AP1P2
ylabel('BP2P1 (degree)'); %label y axis to BP2P1
title('The relationship between output angle (BP2P1) with input angle (AP1P2)');%the title of the graph
grid on %Turn on the grid
%Plot Graph 2
figure(2)
plot(trajectory_Ax,trajectory_Ay,trajectory_Bx,trajectory_By) %plot the data with BP2P1 respected to AP1P2
xlabel('x axis'); %label x axis to AP1P2
ylabel('y axis'); %label y axis to BP2P1
title('Trajectories of point A and B in their operational working range');%the title of the graph
grid on %Turn on the grid