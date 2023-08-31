syms x y x1 y1 x2 y2;
eqn1 = 0.040*cos(40/180*pi)+0.120*cos(x)-0.080*cos(y)-0.100;
eqn2 = 0.040*sin(40/180*pi)+0.120*sin(x)-0.080*sin(y);
sol=solve(eqn1,eqn2);
x=double(sol.x);
y=double(sol.y);
disp("Position")
disp(rad2deg(x))
disp(rad2deg(y))

x=x(1);
y=y(1);
eqn3 = 0.040*25*cos(40/180*pi)+0.120*x1*cos(x)-0.080*y1*cos(y);
eqn4 = -0.040*25*sin(40/180*pi)-0.120*x1*sin(x)+0.080*y1*sin(y);
sol=solve(eqn3,eqn4);
x1=double(sol.x1);
y1=double(sol.y1);
disp("Angular Velocity")
disp(x1)
disp(y1)

eqn5 = -0.040*25*sin(40/180*pi)-0.040*(25^2)*cos(40/180*pi)-0.120*x2*sin(x)-0.120*(x1^2)*cos(x)+0.080*y2*sin(y)+0.080*(y1^2)*cos(y);
eqn6 = 0.040*25*cos(40/180*pi)-0.040*(25^2)*sin(40/180*pi)+0.120*x2*cos(x)-0.120*(x1^2)*sin(x)-0.080*y2*cos(y)+0.080*(y1^2)*sin(y);
sol=solve(eqn5,eqn6);
x2=double(sol.x2);
y2=double(sol.y2);
disp("Angular acceleration")
disp(x2)
disp(y2)