m=1;
b=10;
k=20;
s=tf('s');
sys=1/(m*s^2+b*s+k);
Ts=1/100;
sys_d=c2d(sys,Ts,'zoh')

A=[0 1;-k/m -b/m];
B=[0; 1/m];
C=[0 1];
D=[0];
Ts =1/100;
sys =ss(A,B,C,D);
sys_d=c2d(sys,Ts,'zoh')