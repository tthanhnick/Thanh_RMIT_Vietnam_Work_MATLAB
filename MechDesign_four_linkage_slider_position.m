function F = four_linkage_slider_position(x)

F(1) = 0.040*cos(60/180*pi)-0.120*cos(x(1))-0.020*cos(90/180*pi)-x(2);
F(2) = 0.040*sin(60/180*pi)-0.120*sin(x(1))+0.020*sin(90/180*pi);

