% A=[1 2; 5 1];
% B=[1;0];
% C=[0 1];
% D=0;
% [n,d]=ss2tf(A,B,C,D)
% mySys_tf=tf(n,d)

A=[0 1 0;0 0 1;0 -20 -12];
B=[0;0;1];
C=[1 0 0];
D=0;
[n,d]=ss2tf(A,B,C,D)
mySys_tf=tf(n,d)
