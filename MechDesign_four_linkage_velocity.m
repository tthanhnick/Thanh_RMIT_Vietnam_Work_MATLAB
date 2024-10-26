function F = four_linkage_velocity(x)

F(1) = 0.040*25*cos(40/180*pi)+0.120*x(1)*cos(0.3543)-0.080*x(2)*cos(1.0005);
F(2) = -0.040*25*sin(40/180*pi)-0.120*x(1)*sin(0.3543)+0.080*x(2)*sin(1.0005);

