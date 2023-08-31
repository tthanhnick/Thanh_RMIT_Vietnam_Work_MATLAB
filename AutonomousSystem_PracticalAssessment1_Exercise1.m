% Autonomous System – MANU2480
% Nguyen Tien Thanh -S3818111
% Lecturer Minh Tran
% Exercise 1
%% B.
clear
clc
% Robot parameters 
wheel_base=0.3;
v_left=1;
v_right=2;
% Initial condition
x_0=0; 
y_0=0; 
theta_0=0;
% Time duration
tspan = 0:0.05:10;
% Calculate x y theta
initialState=[x_0 y_0 theta_0];
% Use ODE45 to solve differential equation
[t,y] = ode45(@(t,y)odefun(t,y,v_right,v_left,wheel_base), ...
    tspan,initialState);
% x and y at 10s
x_10s=y(length(t),1);
y_10s=y(length(t),2);
disp("Differential drive at 10s x="+x_10s+" y="+y_10s)
% Figure illustration
figure
% Plot figure x and y
plot(y(:,1),y(:,2));
% Add labels and titles
title("Trajectory x-y axis");
xlabel('x axis m');
ylabel('yaxis m');
% Plot figure theta over time
figure
plot(t,y(:,3));
% Add labels and titles
title("Theta angles over time");
xlabel('time s');
ylabel('theta rad');
%% C.
% Define the Model
carLike = ackermannKinematics("WheelBase",0.3333); 
% Set Up Simulation Parameters
velo = 2;    % Constant linear velocity 
psidot = 3.924;  % Constant left steering rate 
% Define the total time and sample rate 
sampleTime = 0.05;                  % Sample time [s]
timeEnd1 = 0.7;                     % Simulation end time for unconstrained robot 
timeEnd2 = 10;                      % Simulation end time for constrained robot 
tVec1 = 0:sampleTime:timeEnd1;      % Time array for unconstrained robot 
tVec2 = 0:sampleTime:timeEnd2;      % Time array for constrained robot  

initPose = [0;0;0;0];               % Initial pose (x y theta phi) 

% Create Options Structure for ODE Solver 
options = odeset('Events',@detectSteeringSaturation);

% Simulate Model Using ODE Solver 
% Simulate the unconstrained robot 
[t1,pose1] = ode45(@(t,y)derivative(carLike,y,[velo psidot]),tVec1,initPose);

% Simulate the constrained robot 
[t2,pose2,te,ye,ie] = ode45(@(t,y)derivative(carLike,y,[velo psidot]),tVec2,initPose,options);

% Detect Steering Saturation 
if te < timeEnd2
    str1 = "Steering angle limit was reached at ";
    str2 = " seconds";
    comp = str1 + te + str2; 
    disp(comp)
end 

% Simulate Constrained Robot with New Initial Conditions
saturatedPsiDot = 0;             % Steering rate after saturation 
cmds = [velo saturatedPsiDot];   % Command vector 
tVec3 = te:sampleTime:timeEnd2;  % Time vector 
pose3 = pose2(length(pose2),:); 
[t3,pose3,te3,ye3,ie3] = ode45(@(t,y)derivative(carLike,y,cmds), tVec3,pose3, options);

% Plot the Results 
figure
plot(pose1(:,1),pose1(:,2),'--r','LineWidth',2); 
hold on; 
plot([pose2(:,1); pose3(:,1)],[pose2(:,2);pose3(:,2)],'g'); 
title('Trajectory X-Y')
xlabel('X')
ylabel('Y') 
legend('Unconstrained robot','Constrained Robot','Location','northwest')
axis equal
% x and y at 10s
x_10sec=pose3(length(tVec3),1);
y_10sec=pose3(length(tVec3),2);
disp("Akermann drive at 10s x="+x_10sec+" y="+y_10sec)
%% User-defined function
% Differential function of theta,x,y respectively
function dydt = odefun(t,y,v_r,v_l,d)
dydt = zeros(3,1);
dydt(3) = (v_r-v_l)/d; % Theta derivative 
dydt(1) = 1/2*(v_r+v_l)*cos(dydt(3)*t); % X derivative
dydt(2) = 1/2*(v_r+v_l)*sin(dydt(3)*t); % Y derivative
end
% Akermann steering function
function [state,isterminal,direction] = detectSteeringSaturation(t,y)
  maxSteerAngle = 0.785;               % Maximum steering angle (pi/4 radians)
  state(4) = (y(4) - maxSteerAngle);   % Saturation event occurs when the 4th state, theta, is equal to the max steering angle    
  isterminal(4) = 1;                   % Integration is terminated when event occurs 
  direction(4) = 0;                    % Bidirectional termination 

end

