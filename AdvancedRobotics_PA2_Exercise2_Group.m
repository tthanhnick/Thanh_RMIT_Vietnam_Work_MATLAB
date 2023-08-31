% Advanced Robotics
% Group Assignment
%%Exercise 2
% Link length input
L0 = 270.35;
L1 = 69;
L2 = 364.35;
L3 = 69;
L4 = 374.29;
L5 = 10;
L6 = 368.30;

% Angular limit input
th1 = linspace(-141,51,20);
th2 = linspace(-123,60,20);
th3 = linspace(-173,173,20);
th4 = linspace(-3,150,20);
th5 = linspace(-175,175,20);
% th6 = linspace(-90,120,20);
% th7 = linspace(-175,175,20);

[TH1, TH2, TH3, TH4, TH5] = ndgrid(th1, th2, th3, th4, th5);

% a - h terms
a = sind(TH1).*sind(TH3) + cosd(TH1).*sind(TH2).*cosd(TH3);
b = sind(TH1).*cosd(TH3) - cosd(TH1).*sind(TH2).*sind(TH3);
d = cosd(TH1).*sind(TH3) - sind(TH1).*sind(TH2).*cosd(TH3);
f = cosd(TH1).*cosd(TH3) + sind(TH1).*sind(TH2).*sind(TH3);
g = sind(TH2).*sind(TH4) - cosd(TH2).*cosd(TH3).*cosd(TH4);
h = sind(TH2).*cosd(TH4) + cosd(TH2).*cosd(TH3).*sind(TH4);

% A - H terms
A = a.*sind(TH4) - cosd(TH1).*cosd(TH2).*cosd(TH4);
B = a.*cosd(TH4) + cosd(TH1).*cosd(TH2).*sind(TH4);
D = d.*sind(TH4) + sind(TH1).*cosd(TH2).*cosd(TH4);
F = d.*cosd(TH4) - sind(TH1).*cosd(TH2).*sind(TH4);
G = g.*sind(TH5) - cosd(TH2).*sind(TH3).*cosd(TH5);
H = g.*cosd(TH5) + cosd(TH2).*sind(TH3).*sind(TH5);

% x, y, z equations
x = L1.*cosd(TH1) + L2.*cosd(TH1).*cosd(TH2) - L3.*a - L4.*A - L5.*(b.*sind(TH5) + B.*cosd(TH5));
y = L1.*sind(TH1) + L2.*sind(TH1).*cosd(TH2) + L3.*d + L4.*D + L5.*(f.*sind(TH5) + F.*cosd(TH5));
z = - L2.*sind(TH2) - L3.*cosd(TH2).*cosd(TH3) - L4.*h + L5.*H;

% Workspace sketch
plot(x(:),y(:),'.');
title('Top view');
grid on;
xlabel('X'); ylabel('Y')

plot(x(:),z(:),'.');
title('Side view');
grid on;
xlabel('X'); ylabel('Z')

plot(y(:),z(:),'.');
title('Front view');
grid on;
xlabel('Y'); ylabel('Z')
