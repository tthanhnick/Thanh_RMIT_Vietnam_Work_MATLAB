%% Part 1
% Calculate initial velocity
d=183;%displacement
rad=45;%angle indegree
rad=rad*pi/180; %change to radian
g=9.8; %Gravitational acceleration
v0=sqrt(d*g/sin(2*rad));%calculation
v0=v0*3.6;%convert to km/h
fprintf('Initial velocity needed is %1.2f km/h\n',v0) %result
%% Part 2
% Initial height to launch at 45 degree
x=183;%distance between 2 narrowest point in Grand Cannyon
y=0;%when it touches the ground y=0
theta=45*pi/180; % angle
v0=125/3.6; %initial velocity
g=9.8;%gravitational velocity
t=x/(v0*cos(theta));%calculate the time
H=y-v0*t*sin(theta)+1/2*g*t^2;%finding initial height
fprintf('Initial height of 45 deg is %1.2f m\n',H) %display result
%% Part 2
% Plot data of 3 degrees

%45 degree
theta=45*pi/180; % angle
v0=125/3.6; %initial velocity
g=9.8;%gravitational velocity
t=0:0.1:20;%time array
y=H+v0*t*sin(theta)-1/2*g*t.^2; %function of y
x=v0*t*cos(theta);%function of x

%35degree 
theta=35*pi/180; % angle
v0=125/3.6; %initial velocity
g=9.8;%gravitational velocity
t=0:0.1:20; %time array
y1=H+v0*t*sin(theta)-1/2*g*t.^2;%function of y
x1=v0*t*cos(theta);%function of x

%55degree 
theta=55*pi/180; % angle
v0=125/3.6; %initial velocity
g=9.8;%gravitational velocity
t=0:0.1:20;%time array
y2=H+v0*t*sin(theta)-1/2*g*t.^2;%function of y
x2=v0*t*cos(theta); %function of x

%plot data
figure(1) %figure's name
plot(x,y,x1,y1,x2,y2) %plot the data with y respected to x
xlabel('Distance (m)'); %label x axis to distance
ylabel('Height (m)'); %label y axis to height
title('Angle that travels the longest distance being accomplished');%the title of the graph
axis([0 200 0 140]);%limit of x and y
