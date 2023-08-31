s = tf('s');
P = 1/(5*s^2 + 1*s + 0.5);
step(P)

Kp = 75.355;
Kd = 22.0195;
C = pid(Kp,0,Kd)
T1 = feedback(C*P,1)
t = 0:0.01:5;
step(T1,t)

pidTuner(P,'p')
