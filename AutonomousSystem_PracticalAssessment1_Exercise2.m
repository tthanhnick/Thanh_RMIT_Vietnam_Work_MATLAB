% Autonomous System – MANU2480
% Nguyen Tien Thanh -S3818111
% Lecturer Minh Tran
clear
clc
% Robot parameters
wheel_radius=0.035;
wheel_base=0.25;
% Initial condition
x_0=0; 
y_0=2; 
theta_0=pi/2;
% Recorded data of 2 wheels
omega_left=[15;15.5;16.2;16.1;15.4;15.7];
omega_right=[15;15.4;16.0;16.3;15.0;15.3];
v_left=omega_left*wheel_radius;
v_right=omega_right*wheel_radius;
% Time duration
time_step=1;
t = 0:time_step:5;

% Solve for x y and theta by use discrete model
% Substitute the initial condion
x(1,1)=x_0; y(1,1)=y_0; theta(1,1)=theta_0;
k=1;
for i=1:length(t)-1
    theta(k+1,1)=theta(k,1)+((v_right(k,1)-v_left(k,1))/wheel_base)*time_step;
    k=k+1; % Increment k
end

k=1;
for i=1:length(t)-1
    x(k+1,1)=x(k,1)+1/2*(v_right(k,1)+v_left(k,1))*cos(theta(k,1))*time_step;
    k=k+1; % Increment k
end
k=1;
for i=1:length(t)-1
    y(k+1,1)=y(k,1)+1/2*(v_right(k,1)+v_left(k,1))*sin(theta(k,1))*time_step;
    k=k+1; % Increment k
end

% Point A at 0s and B at 5s
xa=x(1);
ya=y(1);
disp("Point A is("+xa+","+ya+")")
xb=x(length(t));
yb=y(length(t));
disp("Point B is("+xb+","+yb+")")
% Convert coordinate from number to string
str_a=['A(',num2str(x(1)),',',num2str(y(1)),')'];
str_b=['B(',num2str(x(length(t))),',',num2str(y(length(t))),')'];

% Graph illustration
figure
% Plot figure
plot(x,y)
% Add title and labels
title("X and Y axis");
xlabel('x axis m');
ylabel('y axis m');
text(xa,ya,str_a,HorizontalAlignment="left",VerticalAlignment="bottom");
text(xb,yb,str_b,HorizontalAlignment="right",VerticalAlignment="top");
