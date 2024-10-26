s = tf('s');
P = 1/(1*s^2 + 0.2768*s + -55.8505);
step(P)

Kp = 16676.5716092448;
ki = 77547.0436241155;
Kd = 796.836595108623;
C = pid(Kp,ki,Kd)
T1 = feedback(C*P,1)
t = 0:0.01:5;
step(T1,t)

pidTuner(P,'p')
