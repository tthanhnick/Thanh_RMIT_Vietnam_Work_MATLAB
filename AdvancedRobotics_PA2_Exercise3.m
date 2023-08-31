MANU2478 -  Practical Assessment 2
Course: Advanced Robotics. 
Nguyen Tien Thanh - S3818111
Exercise 3
Parameters for the system
clearvars
close all
clc

% Note that JL=1 CL 0.5 default
L=0.0006; R=1.4; JM=0.00844;
CM=0.00013; Ka=12; n=200;
Kb=0.00867; KM=4.375;
JL=1; CL=0.5; g= 386.1; Ke=1;

% Polar inertia
J=JM+JL/n^2;
% Damping coefficient
C=CM+CL/n^2;

% JL=2000; CL=1000; for exercise 3C
% Part D
l=6.4; m=200; 
