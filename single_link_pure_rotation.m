syms fx fy t
A=[1 0 0;0 1 0;2.5 -4.33 1];
% B=[fx;fy;t];
t=[-57.67;-9.39;101.2];
y=A\t;% inv(A)*t
disp(y)