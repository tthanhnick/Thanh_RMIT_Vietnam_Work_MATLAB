function F = four_linkage_position(x)

F(1) = 0.040*cos(40/180*pi)+0.120*cos(x(1))-0.080*cos(x(2))-0.100;
F(2) = 0.040*sin(40/180*pi)+0.120*sin(x(1))-0.080*sin(x(2));

