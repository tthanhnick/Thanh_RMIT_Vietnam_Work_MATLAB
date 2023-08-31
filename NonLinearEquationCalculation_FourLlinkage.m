% fun = @four_linkage_position;
% x0 = [0,0];
% x = fsolve(fun,x0)
% 
% fun = @four_linkage_velocity;
% x0 = [0,0];
% x = fsolve(fun,x0)

fun = @four_linkage_acceleration;
x0 = [0,0];
x = fsolve(fun,x0)

% fun = @four_linkage_slider_position;
% x0 = [0,0];
% x = fsolve(fun,x0)
% 
% fun = @four_linkage_slider_velocity;
% x0 = [0,0];
% x = fsolve(fun,x0)

% fun = @four_linkage_slider_crank_position;
% x0 = [0,0];
% x = fsolve(fun,x0)
% 
% fun = @four_linkage_slider_crank_velocity;
% x0 = [0,0];
% x = fsolve(fun,x0)