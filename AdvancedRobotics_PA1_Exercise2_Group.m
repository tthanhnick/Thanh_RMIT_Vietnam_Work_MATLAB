%MANU2478 -  Practical Assessment 2
% Group project
%% Exercise 2A

clearvars
close all
clc

disp('Problem 2')
disp('a)')
% Enter Euler angle for theta1-theta2-theta3
theta1 = input('Enter the value for theta1 in radian:') 
theta2 = input('Enter the value for theta2 in radian:') 
theta3 = input('Enter the value for theta3 in radian:') 
% The homogeneous transformation matrix for link OA, AB and BC
OTA = [cos(theta1) -sin(theta1) 0 0; sin(theta1) cos(theta1) 0 0; 0 0 1 0; 0 0 0 1]
ATB = [cos(theta2) -sin(theta2) 0 1; sin(theta2) cos(theta2) 0 0; 0 0 1 0; 0 0 0 1]
BTC = [cos(theta3) -sin(theta3) 0 0.8; sin(theta3) cos(theta3) 0 0; 0 0 1 0; 0 0 0 1]
% The homogeneous transformation matrix of OC
OTC = OTA*ATB*BTC
% End point C position
PC = OTC(1:3,4)


%% Exercise 2B

clearvars
close all
clc

disp('Problem 2')
disp('b)')
% Loop to go through every possible combination of values of theta1
for theta1 = 0:pi/18:pi/6
    % Loop to go through every possible combination of values of theta2
    for theta2 = 0:pi/18:pi/2
        % Loop to go through every possible combination of values of theta3
        for theta3 = 0:pi/18:pi/7
            % Equation to calculate x and y coordinate of end point C
            x = 0.3*cos(theta1 + theta2 + theta3)+0.8*cos(theta1 + theta2)+1*cos(theta1);
            y = 0.3*sin(theta1 + theta2 + theta3)+0.8*sin(theta1 + theta2)+1*sin(theta1);
            PC = [x y]';
            % Plot every possible position of end point C 
            plot_point(PC, 'solid', 'ro');
            hold on % Hold the current plot
        end
    end
end

grid on % Turn on grid in the plot
xlabel('X-axis in m')
ylabel('Y-axis in m')
hold off % Default mode


%% Exercise 2C

clearvars
close all
clc

disp('Problem 2')
disp('c)')

theta1 = pi/3;
theta2 = pi/4;
theta3 = pi/6;
% Coordinate of point O
Ox = 0
Oy = 0
% Equation to calculate x and y coordinate of point A
Ax = 1*cos(theta1)
Ay = 1*sin(theta1)
% Equation to calculate x and y coordinate of point B
Bx = Ax + 0.8*cos(theta1 + theta2)
By = Ay + 0.8*sin(theta1 + theta2)
% Equation to calculate x and y coordinate of end point C
Cx = Bx + 0.3*cos(theta1 + theta2 + theta3)
Cy = By + 0.3*sin(theta1 + theta2 + theta3)
% Plot all the link of the robot and their relationship   
plot([Ox Ax], [Oy Ay], [Ax Bx], [Ay By], [Bx Cx], [By Cy], 'LineWidth',3)
hold on % Hold the current plot
grid on % Turn on grid in the plot
axis ([0 2 0 2]) % Length of x, y axis
axis equal % Scale the plot to be equal
xlabel('X-axis in m')
ylabel('Y-axis in m')
drawnow
hold off % Default mode


%% Exercise 2D

clearvars
close all
clc

disp('Problem 2')
disp('d)')
% Loop to run the animation of the robot
for t = 0:0.25:10 % 0 to 10 seconds with step of 0.25 second
    theta1 = sin(t);
    theta2 = 0.8*sin(0.7*t);
    theta3 = 2*sin(1.2*t);
    % Coordinate oF point O
    Ox = 0;
    Oy = 0;
    % Equation to calculate x and y coordinate of point A
    Ax = 1*cos(theta1);
    Ay = 1*sin(theta1);
    % Equation to calculate x and y coordinate of point B
    Bx = Ax + 0.8*cos(theta1 + theta2);
    By = Ay + 0.8*sin(theta1 + theta2);
    % Equation to calculate x and y coordinate of end point C
    Cx = Bx + 0.3*cos(theta1 + theta2 + theta3);
    Cy = By + 0.3*sin(theta1 + theta2 + theta3);
    % Plot all the link of the robot and their relationship  
    plot([Ox Ax], [Oy Ay], [Ax Bx], [Ay By], [Bx Cx], [By Cy], 'LineWidth',3);
    hold on % Hold the current plot
    grid on % Turn on grid in the plot
    axis ([-2 2 -2 2]) % Length of x, y axis
    axis equal % Scale the plot to be equal
    xlabel('X-axis in m')
    ylabel('Y-axis in m')
    drawnow
    hold off % Default mode
end


%% Exercise 2E

clearvars
close all
clc

disp('Problem 2')
disp('e)')
% Loop to go through every possible combination of values of theta1
for theta1 = 0:60:180
    % Loop to go through every possible combination of values of theta2
    for theta2 = 0:60:180
        % Loop to go through every possible combination of values of theta3
        for theta3 = 0:60:180
            angle = [theta1; theta2; theta3];
            theta_angle = angle*(pi/180); % Convert theta into rad
            % Fsolve to calculate the possible combination of theta angles
            result_in_rad = fsolve(@(theta)f(theta), theta_angle) 
            % Convert the result into degree
            result_in_degree = result_in_rad*(180/pi) 
        end
    end
end


function func = f(theta) % Function to calculate theta angles
    func = [1.8 - 1*cos(theta(1)) - 0.8*cos(theta(1) + theta(2)) - 0.3*cos(theta(1) + theta(2) + theta(3)); 
            1 - 1*sin(theta(1)) - 0.8*sin(theta(1) + theta(2)) - 0.3*sin(theta(1) + theta(2) + theta(3))];
end










