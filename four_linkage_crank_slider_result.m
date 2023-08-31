syms x y x1 y1;
eqn1 = 0.040*cos(x)-0.120*cos(y)-0.020*cos(90/180*pi)-0.1;
eqn2 = 0.040*sin(x)-0.120*sin(y)+0.020*sin(90/180*pi);
sol=solve(eqn1,eqn2);
disp("Position")
x=double(sol.x);
y=double(sol.y);

disp(rad2deg(x))
disp(rad2deg(y))

x=x(1);
y=y(1);
eqn3 = 0.040*25*cos(x)-0.120*x1*cos(y)-0.020*y1*cos(90/180*pi);
eqn4 = -0.040*25*sin(x)+0.120*x1*sin(y)-0.020*y1*sin(90/180*pi);
sol=solve(eqn3,eqn4);
x1=double(sol.x1);
y1=double(sol.y1);
disp("Angular Velocity")
disp(x1)
disp(y1)