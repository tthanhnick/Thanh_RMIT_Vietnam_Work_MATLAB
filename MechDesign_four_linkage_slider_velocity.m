function F = four_linkage_slider_velocity(x)

F(1) = 0.040*25*cos(60/180*pi)-0.120*x(1)*cos(0.4728)-0.020*x(2)*cos(90/180*pi);
F(2) = -0.040*25*sin(60/180*pi)+0.120*x(1)*sin(0.4728)-0.020*x(2)*sin(90/180*pi);

