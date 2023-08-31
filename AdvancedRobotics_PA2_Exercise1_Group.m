% Reference: R. L. Williams, Baxter Humanoid Robot Kinematics, III. Mechanical Engineering, Ohio University: Dr. Bob Productions, n.d.. 
%MANU2478 -  Practical Assessment 2
%Course: Advanced Robotics. 
%Group Assignment
clearvars
close all
clc

%%Exercise 1A
%process the data fie from the group4.bag and then extract it to the Excel file
disp('1A')
% Process data
processed_data = data_extract('group4.bag')
% save and load workspace
load('processed_data.mat')
% Convert the workspace from the array to table
group4 = array2table(processed_data)

% Change the name of each colum header
group4=renamevars(group4,["processed_data1","processed_data2","processed_data3",...
"processed_data4","processed_data5","processed_data6",...
"processed_data7","processed_data8","processed_data9","processed_data10", ...
"processed_data11","processed_data12","processed_data13","processed_data14",...
"processed_data15","processed_data16","processed_data17","processed_data18",...
"processed_data19","processed_data20","processed_data21","processed_data22",...
"processed_data23","processed_data24","processed_data25","processed_data26", ...
"processed_data27","processed_data28","processed_data29","processed_data30"]...
,["Time_sec","Time_Nsec","Joint_position_1",...
"Joint_position_2","Joint_position_3","Joint_position_4",...
"Joint_position_5","Joint_position_6","Joint_position_7","Joint_velocity_1", ...
"Joint_velocity_2","Joint_velocity_3","Joint_velocity_4","Joint_velocity_5",...
"Joint_velocity_6","Joint_velocity_7","Joint_torque_1","Joint_torque_2",...
"Joint_torque_3","Joint_torque_4","Joint_torque_5","Joint_torque_6",...
"Joint_torque_7","End effector_Cartesian_coordinate_X","End effector_Cartesian_coordinate_Y",...
"End effector_Cartesian_coordinate_Z","End_effector_Cartesian_orientation_quaternion_W",...
"End_effector_Cartesian_orientation_quaternion_X","End_effector_Cartesian_orientation_quaternion_Y",...
"End_effector_Cartesian_orientation_quaternion_Z"])

% Convert the table to Excel file
writetable(group4,'group4.xlsx','Sheet',1,'Range','A1')

%%Exercise 1B Calculate the end point of the robot
disp('1B')
% Robot parameters
L0=0.27035; L1=0.069; L2=0.36435; L3=0.069;
L4=0.37429; L5=0.01; L6=0.3683;
L=0.278; h=0.064; H=1.104;

% Input the angle of each joint in radian
disp('Joint angles must be in radian')
theta_1 = input("input angle of joint 1 shoulder 0 ")
theta_2 = input("input angle of joint 2 shoulder 1 ")
theta_3 = input("input angle of joint 3 elbow 0 ")
theta_4 = input("input angle of joint 4 elbow 1 ")
theta_5 = input("input angle of joint 5 wrist 0 ")
theta_6 = input("input angle of joint 6 wrist 1 ")
theta_7 = input("input angle of joint 7 wrist 2 ")

% shoulder joint angles with respect to the top view origin
% Left side
TWoBL=[sqrt(2)/2 sqrt(2)/2 0 L;
       -sqrt(2)/2 sqrt(2)/2 0 -h;
       0 0 1 H;
       0 0 0 1]

% Right side
TWoBR=[-sqrt(2)/2 sqrt(2)/2 0 -L;
       -sqrt(2)/2 -sqrt(2)/2 0 -h;
       0 0 1 H;
       0 0 0 1]

% Joint transformation matrices
% Joint 0 to Joint 1
T01=[cos(theta_1) -sin(theta_1) 0 0;
    sin(theta_1) cos(theta_1) 0 0;
    0 0 1 0;
    0 0 0 1]

% Joint 1 to Joint 2
T12=[-sin(theta_2) -cos(theta_2) 0 L1;
     0 0 1 0;
     -cos(theta_2) sin(theta_2) 0 0;
     0 0 0 1]

% Joint 2 to Joint 3
T23=[cos(theta_3) -sin(theta_3) 0 0;
    0 0 -1 -L2;
    sin(theta_3) cos(theta_3) 0 0;
    0 0 0 1]

% Joint 3 to Joint 4
T34=[cos(theta_4) -sin(theta_4) 0 L3;
    0 0 1 0;
    -sin(theta_4) -cos(theta_4) 0 0;
    0 0 0 1]

% Joint 4 to Joint 5
T45=[cos(theta_5) -sin(theta_5) 0 0;
    0 0 -1 -L4;
    sin(theta_5) cos(theta_5) 0 0;
    0 0 0 1]

% Joint 5 to Joint 6
T56=[cos(theta_6) -sin(theta_6) 0 L5;
    0 0 1 0;
    -sin(theta_6) -cos(theta_6) 0 0;
    0 0 0 1]

% Joint 6 to Joint 7
T67=[cos(theta_7) -sin(theta_7) 0 0;
     0 0 -1 0;
     sin(theta_7) cos(theta_7) 0 0;
     0 0 0 1]

% Joint 0 to Joint 7
T07=T01*T12*T23*T34*T45*T56*T67

% Ground to the base transformation matrices
%Left side
TBL0=[1 0 0 0;
      0 1 0 0;
      0 0 1 L0;
      0 0 0 1]
% Right side
TBR0=TBL0;

% Joint 7 to the gripper transformation matrices
%Left side
T7GL=[1 0 0 0;
      0 1 0 0;
      0 0 1 L6;
      0 0 0 1]
% Right side
T7GR=T7GL;

% Overall 7-dof Baxter left-arm transformation matrices
TWGL=TWoBL*TBL0*T07*T7GL
% Overall 7-dof Baxter right-arm transformation matrices
TWGR=TWoBR*TBR0*T07*T7GR

% Left end effector cartesian cordinate
P0L=TWGL(1:3,4)
% Left end effector cartesian cordinate
P0R=TWGR(1:3,4)

%% Exercise 1C
clearvars
close all
clc

disp('Problem 1')
disp('c)')

% Read data from the xlsx file
load('C:\Users\DELL\Documents\MATLAB\MATLAB\processed_data.mat');

% Random value of joint angle
theta1 = -0.8176;
theta2 = -0.4817;
theta3 = 0.0383;
theta4 = 1.3714;
theta5 = -3.046;
theta6 = -0.677;
theta7 = 2.353;

% Plot all the position of the end effector the robot
figure(1)
% The position of the end effector based on the calculation
Ex = xf(theta1, theta2, theta3, theta4, theta5, theta6, theta7)
Ey = yf(theta1, theta2, theta3, theta4, theta5, theta6, theta7)
hold on % Hold the current plot
% Plot all the position of the end effector the robot based on calculation
scatter(-Ey,Ex,'filled');

% The position of the end effector the robot based on expiremental data
eecoordinatex = processed_data(4,24);
eecoordinatey = processed_data(4,25);
% Plot the position of the end effector the robot based on expiremental data
scatter(eecoordinatex,eecoordinatey, 'filled'); 

title('End Effector Position');
legend('Expiremental','Calculated')
grid on % Turn on grid in the plot
axis equal % Scale the plot to be equal
xlabel('X-axis in m')
ylabel('Y-axis in m')
drawnow
hold off % Default mode

% Plot the trajectory path of the end effector
figure(2)
% Go through every row of joint angle in the datasheet
theta_1 = processed_data(:,3);
theta_2 = processed_data(:,4);
theta_3 = processed_data(:,5);
theta_4 = processed_data(:,6);
theta_5 = processed_data(:,7);
theta_6 = processed_data(:,8);
theta_7 = processed_data(:,9);
% Calculate the end effector position
Ex = xf(theta_1, theta_2, theta_3, theta_4, theta_5, theta_6, theta_7);
Ey = yf(theta_1, theta_2, theta_3, theta_4, theta_5, theta_6, theta_7);
hold on % Hold the current plot
% Plot the path of the end effector based on the calculation
scatter(-Ey,Ex, 'filled');

% Go through every row of end effector coordinate in the datasheet
eecoordinatex = processed_data(:,24);
eecoordinatey = processed_data(:,25);
% Plot the path of the end effector the robot based on expiremental data
scatter(eecoordinatex,eecoordinatey, 'filled'); 
title('Trajectory path of End Effector')
legend('Expiremental','Calculated')
grid on % Turn on grid in the plot
% axis equal % Scale the plot to be equal
xlabel('X-axis in m')
ylabel('Y-axis in m')
drawnow
hold off % Default mode
 

function Ex = xf(theta_1, theta_2, theta_3, theta_4, theta_5, theta_6, theta_7) 
    % Robot parameters
    L0=0.27035; L1=0.069; L2=0.36435; L3=0.069; L4=0.37429; 
    L5=0.010; L6=0.3683; L=0.278; h=0.064; H=1.104;
    
    Ex = L - (2^(1/2).*(L3.*(sin(theta_1).*sin(theta_3)...
        - cos(theta_1).*cos(theta_3).*cos(theta_2 + pi/2))...
        + L5.*(cos(theta_5).*(cos(theta_4).*(sin(theta_1).*sin(theta_3)...
        - cos(theta_1).*cos(theta_3).*cos(theta_2 + pi/2))...
        + cos(theta_1).*sin(theta_4).*sin(theta_2 + pi/2))...
        + sin(theta_5).*(cos(theta_3).*sin(theta_1)...
        + cos(theta_1).*cos(theta_2 + pi/2).*sin(theta_3)))...
        - L1.*cos(theta_1) + L4*(sin(theta_4).*(sin(theta_1).*sin(theta_3)...
        - cos(theta_1).*cos(theta_3).*cos(theta_2 + pi/2))...
        - cos(theta_1).*cos(theta_4).*sin(theta_2 + pi/2))...
        - L2.*cos(theta_1).*sin(theta_2 + pi/2)))/2 + (2^(1/2).*(L3.*(cos(theta_1).*sin(theta_3)...
        + cos(theta_3).*cos(theta_2 + pi/2).*sin(theta_1))...
        + L5.*(cos(theta_5).*(cos(theta_4).*(cos(theta_1).*sin(theta_3)...
        + cos(theta_3).*cos(theta_2 + pi/2).*sin(theta_1))...
        - sin(theta_1).*sin(theta_4).*sin(theta_2 + pi/2))...
        + sin(theta_5).*(cos(theta_1).*cos(theta_3)...
        - cos(theta_2 + pi/2).*sin(theta_1).*sin(theta_3)))...
        + L1.*sin(theta_1) + L4.*(sin(theta_4).*(cos(theta_1).*sin(theta_3)...
        + cos(theta_3).*cos(theta_2 + pi/2).*sin(theta_1))...
        + cos(theta_4).*sin(theta_1).*sin(theta_2 + pi/2))...
        + L2.*sin(theta_1).*sin(theta_2 + pi/2)))/2 ...
        - L6.*((2^(1/2)*(cos(theta_6).*(sin(theta_4).*(sin(theta_1).*sin(theta_3)...
        - cos(theta_1).*cos(theta_3).*cos(theta_2 + pi/2))...
        - cos(theta_1).*cos(theta_4).*sin(theta_2 + pi/2))...
        + sin(theta_6).*(cos(theta_5).*(cos(theta_4).*(sin(theta_1).*sin(theta_3)...
        - cos(theta_1).*cos(theta_3).*cos(theta_2 + pi/2))...
        + cos(theta_1).*sin(theta_4).*sin(theta_2 + pi/2))...
        + sin(theta_5).*(cos(theta_3).*sin(theta_1)...
        + cos(theta_1).*cos(theta_2 + pi/2).*sin(theta_3)))))/2 ...
        - (2^(1/2).*(cos(theta_6).*(sin(theta_4).*(cos(theta_1).*sin(theta_3)...
        + cos(theta_3).*cos(theta_2 + pi/2).*sin(theta_1))...
        + cos(theta_4).*sin(theta_1).*sin(theta_2 + pi/2))...
        + sin(theta_6).*(cos(theta_5).*(cos(theta_4).*(cos(theta_1).*sin(theta_3)...
        + cos(theta_3).*cos(theta_2 + pi/2).*sin(theta_1))...
        - sin(theta_1).*sin(theta_4).*sin(theta_2 + pi/2))...
        + sin(theta_5).*(cos(theta_1).*cos(theta_3)...
        - cos(theta_2 + pi/2).*sin(theta_1).*sin(theta_3)))))/2);

end

function Ey = yf(theta_1, theta_2, theta_3, theta_4, theta_5, theta_6, theta_7) 
    % Robot parameters
    L0=0.27035; L1=0.069; L2=0.36435; L3=0.069; L4=0.37429; 
    L5=0.010; L6=0.3683; L=0.278; h=0.064; H=1.104;
    
    Ey = (2^(1/2).*(L3.*(sin(theta_1).*sin(theta_3)...
        - cos(theta_1).*cos(theta_3).*cos(theta_2 + pi/2))...
        + L5.*(cos(theta_5).*(cos(theta_4).*(sin(theta_1).*sin(theta_3)...
        - cos(theta_1).*cos(theta_3).*cos(theta_2 + pi/2))...
        + cos(theta_1).*sin(theta_4).*sin(theta_2 + pi/2))...
        + sin(theta_5).*(cos(theta_3).*sin(theta_1)...
        + cos(theta_1).*cos(theta_2 + pi/2).*sin(theta_3)))...
        - L1.*cos(theta_1) + L4.*(sin(theta_4).*(sin(theta_1).*sin(theta_3)...
        - cos(theta_1).*cos(theta_3).*cos(theta_2 + pi/2))...
        - cos(theta_1).*cos(theta_4).*sin(theta_2 + pi/2))...
        - L2.*cos(theta_1).*sin(theta_2 + pi/2)))/2 ...
        - h + (2^(1/2).*(L3*(cos(theta_1).*sin(theta_3)...
        + cos(theta_3).*cos(theta_2 + pi/2).*sin(theta_1))...
        + L5.*(cos(theta_5).*(cos(theta_4).*(cos(theta_1).*sin(theta_3)...
        + cos(theta_3).*cos(theta_2 + pi/2).*sin(theta_1))...
        - sin(theta_1).*sin(theta_4).*sin(theta_2 + pi/2))...
        + sin(theta_5).*(cos(theta_1).*cos(theta_3)...
        - cos(theta_2 + pi/2).*sin(theta_1).*sin(theta_3)))...
        + L1.*sin(theta_1) + L4.*(sin(theta_4).*(cos(theta_1).*sin(theta_3)...
        + cos(theta_3).*cos(theta_2 + pi/2).*sin(theta_1))...
        + cos(theta_4).*sin(theta_1).*sin(theta_2 + pi/2))...
        + L2.*sin(theta_1).*sin(theta_2 + pi/2)))/2 ...
        + L6.*((2^(1/2).*(cos(theta_6).*(sin(theta_4).*(sin(theta_1).*sin(theta_3)...
        - cos(theta_1).*cos(theta_3).*cos(theta_2 + pi/2))...
        - cos(theta_1).*cos(theta_4).*sin(theta_2 + pi/2))...
        + sin(theta_6).*(cos(theta_5).*(cos(theta_4).*(sin(theta_1).*sin(theta_3)...
        - cos(theta_1).*cos(theta_3).*cos(theta_2 + pi/2))...
        + cos(theta_1).*sin(theta_4).*sin(theta_2 + pi/2))...
        + sin(theta_5).*(cos(theta_3).*sin(theta_1)...
        + cos(theta_1).*cos(theta_2 + pi/2).*sin(theta_3)))))/2 ...
        + (2^(1/2).*(cos(theta_6).*(sin(theta_4).*(cos(theta_1).*sin(theta_3)...
        + cos(theta_3).*cos(theta_2 + pi/2).*sin(theta_1))...
        + cos(theta_4).*sin(theta_1).*sin(theta_2 + pi/2))...
        + sin(theta_6).*(cos(theta_5).*(cos(theta_4).*(cos(theta_1).*sin(theta_3)...
        + cos(theta_3).*cos(theta_2 + pi/2).*sin(theta_1))...
        - sin(theta_1).*sin(theta_4).*sin(theta_2 + pi/2))...
        + sin(theta_5).*(cos(theta_1).*cos(theta_3)...
        - cos(theta_2 + pi/2).*sin(theta_1).*sin(theta_3)))))/2);
end

%% Exercise 1D
clearvars
close all
clc

disp('Problem 1')
disp('d)')

% Robot parameters
L0=0.27035; L1=0.069; L2=0.36435; L3=0.069; L4=0.37429; 
L5=0.010; L6=0.3683; L=0.278; h=0.064; H=1.104;

% Input the angle of each joint angle
theta_1 = -0.8176;
theta_2 = -0.4817;
theta_3 = 0.0383;
theta_4 = 1.3714;
theta_5 = -3.046;
theta_6 = -0.677;
theta_7 = 2.353;

% shoulder joint angles with respect to the top view origin
% Left side
TWoBL=[sqrt(2)/2 sqrt(2)/2 0 L; -sqrt(2)/2 sqrt(2)/2 0 -h; 0 0 1 H; 0 0 0 1];
% Joint transformation matrices
% Joint 0 to Joint 1
T01=[cos(theta_1) -sin(theta_1) 0 0; sin(theta_1) cos(theta_1) 0 0; 0 0 1 0; 0 0 0 1];
% Joint 1 to Joint 2
T12=[-sin(theta_2) -cos(theta_2) 0 L1; 0 0 1 0; -cos(theta_2) sin(theta_2) 0 0; 0 0 0 1];
% Joint 2 to Joint 3
T23=[cos(theta_3) -sin(theta_3) 0 0; 0 0 -1 -L2; sin(theta_3) cos(theta_3) 0 0; 0 0 0 1];
% Joint 3 to Joint 4
T34=[cos(theta_4) -sin(theta_4) 0 L3; 0 0 1 0; -sin(theta_4) -cos(theta_4) 0 0; 0 0 0 1];
% Joint 4 to Joint 5
T45=[cos(theta_5) -sin(theta_5) 0 0; 0 0 -1 -L4; sin(theta_5) cos(theta_5) 0 0; 0 0 0 1];
% Joint 5 to Joint 6
T56=[cos(theta_6) -sin(theta_6) 0 L5; 0 0 1 0; -sin(theta_6) -cos(theta_6) 0 0; 0 0 0 1];
% Joint 6 to Joint 7
T67=[cos(theta_7) -sin(theta_7) 0 0; 0 0 -1 0; sin(theta_7) cos(theta_7) 0 0; 0 0 0 1];
% Joint 0 to Joint 7
T07=T01*T12*T23*T34*T45*T56*T67;
% Ground to the base transformation matrices
%Left side
TBL0=[1 0 0 0; 0 1 0 0; 0 0 1 L0; 0 0 0 1];
% Joint 7 to the gripper transformation matrices
% Left arm
T7GL=[1 0 0 0; 0 1 0 0; 0 0 1 L6; 0 0 0 1];
disp('Rotational Matrix according to {W0} frame from question 1b):')
% Overall 7-dof Baxter left-arm transformation matrices
TWGL=TWoBL*TBL0*T07*T7GL;
R0 = TWGL(1:3,1:3)
disp('Rotational Matrix modified according to the camera frame:')
RC = [-TWGL(2,1:3); TWGL(1,1:3); TWGL(3,1:3)]

% The quaternion value from datasheet (match with the joint angle above)
W = 0.0179;
x = -0.3415;
y = 0.988;
z = 0.0425;
disp('Quaternion to rotational matrix:')
% First row of the rotational matrix from quaterrnion values
r11 = (W^2) + (x^2) - (y^2) - (z^2)
r12 = 2*x*y - 2*W*z
r13 = 2*x*z + 2*W*y
% Second row of the rotational matrix from quaterrnion values
r21 = 2*x*y + 2*W*z
r22 = (W^2) - (x^2) + (y^2) - (z^2)
r23 = 2*y*z - 2*W*x
% Third row of the rotational matrix from quaterrnion values
r31 = 2*x*z - 2*W*y
r32 = 2*y*z + 2*W*x
r33 = (W^2) - (x^2) - (y^2) + (z^2)

% Quaternion to rotational matrix
disp('Quaternion to rotational matrix based on the camera frame (datasheet):')



MR = [r11 r12 r13; r21 r22 r23; r31 r32 r33]
