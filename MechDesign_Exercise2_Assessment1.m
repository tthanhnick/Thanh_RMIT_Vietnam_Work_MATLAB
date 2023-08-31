%Call the variables
syms theta3 theta4;%Angle
syms omega3 omega4;%Angular velocity 
syms alpha3 alpha4;%Acceleration
%Calculate the system of non linear equations for the position
eqn1 = 0.3*cos(60/180*pi)+0.36*cos(theta3)-0.36*cos(theta4)-0.6;
eqn2 = 0.3*sin(60/180*pi)+0.36*sin(theta3)-0.36*sin(theta4);
sol=solve(eqn1,eqn2);
theta3=double(sol.theta3);
theta4=double(sol.theta4);
%Display the position result in deg and rad
disp("Position")
disp(rad2deg(theta3(1)))
disp(rad2deg(theta4(1)))
disp("Angular Position") %Take the first result of theta 3 and 4
disp(theta3(1))
disp(theta4(1))

%Calculate the system of non linear equations for the angular velocity
eqn3 = -0.3*10*sin(60/180*pi)-0.36*omega3*sin(theta3(1))+0.36*omega4*sin(theta4(1));
eqn4 = 0.3*10*cos(60/180*pi)+0.36*omega3*cos(theta3(1))-0.36*omega4*cos(theta4(1));
sol=solve(eqn3,eqn4);
omega3=double(sol.omega3);
omega4=double(sol.omega4);
%Display the result of the angular velocity
disp("Angular Velocity")
disp(omega3)
disp(omega4)

%Calculate the system of non linear equations for the angular acceleration
eqn7 = -0.3*30*sin(60/180*pi)-0.3*(10^2)*cos(60/180*pi)-0.36*alpha3*sin(theta3(1))-0.36*(omega3^2)*cos(theta3(1))+0.36*alpha4*sin(theta4(1))+0.36*(omega4^2)*cos(theta4(1));
eqn8 = 0.3*30*cos(60/180*pi)-0.3*(10^2)*sin(60/180*pi)+0.36*alpha3*cos(theta3(1))-0.36*(omega3^2)*sin(theta3(1))-0.36*alpha4*cos(theta4(1))+0.36*(omega4^2)*sin(theta4(1));
sol=solve(eqn7,eqn8);
alpha3=double(sol.alpha3);
alpha4=double(sol.alpha4);
%Display the result of the angular acceleration
disp("Angular acceleration")
disp(alpha3)
disp(alpha4)