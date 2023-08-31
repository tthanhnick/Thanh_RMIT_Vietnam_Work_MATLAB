function F = four_linkage_slider_crank_velocity(x)

F(1) = 0.040*25*cos(1.6721)-0.120*x(1)*cos(2.6200)-0.020*x(2)*cos(90/180*pi);
F(2) = -0.040*25*sin(1.6721)+0.120*x(1)*sin(2.6200)-0.020*x(2)*sin(90/180*pi);

