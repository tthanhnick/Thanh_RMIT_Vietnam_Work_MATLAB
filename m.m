%Nguyen Tien Thanh -S3818111
clearvars
close all
clc
%Exercise 3A 
%Calculate the euler transformation matrix
%Section A with alpha=10 beta=20 gamma=30
%% Section 3A
disp('Exercise 3')
disp('Section A')
disp('section i')
disp('alpha=10 beta=20 gamma=30')
% ARB=Rz*Ry*Rx Euler
ARB = rotz(10,'deg')*roty(20,'deg')*rotx(30,'deg')
%Demonstrate constraints of 3x3 matrix
disp('6 Constraint of the 3x3 matrix')
disp('absolute value of unit vector =1')
% |x_hat|=1
x_hat=sqrt(ARB(1,1)^2+ARB(1,2)^2+ARB(1,3)^2)
% |y_hat|=1
y_hat=sqrt(ARB(2,1)^2+ARB(2,2)^2+ARB(2,3)^2)
% |z_hat|=1
z_hat=sqrt(ARB(3,1)^2+ARB(3,2)^2+ARB(3,3)^2)
disp('product of 2 unit vector=0')
% x_hat*y_hat=0
product_xyhat=ARB(1,1)*ARB(2,1)*ARB(3,1)+ARB(1,2)*ARB(2,2)*ARB(3,2)
% x_hat*z_hat=0
product_xzhat=ARB(1,1)*ARB(2,1)*ARB(3,1)+ARB(1,3)*ARB(2,3)*ARB(3,3)
% y_hat*z_hat=0
product_yzhat=ARB(1,2)*ARB(2,2)*ARB(3,2)+ARB(1,3)*ARB(2,3)*ARB(3,3)
%Demonstrate the beautiful property
disp('Calculate inverse and transpose')
% Inverse matrix
ARB_inverse=inv(ARB)
% Transpose matrix
ARB_transpose=ARB'
disp('identity matrix')
% Identity matrix=ARB*ARB' or ARB*ARB^-1
identity_transpose=ARB*ARB_transpose
identity_inverse=ARB/ARB  
Section 2 with alpha=30 beta=90 gamma=-55
disp('section ii')
disp('alpha=30 beta=90 gamma=-55')
% ARB=Rz*Ry*Rx Euler
ARB_2 = rotz(30,'deg')*roty(90,'deg')*rotx(-55,'deg')

%%Exercise 3B  
%Users input 3x3 matrix
%Input matrix from left to right and top to down
%% Section 3B
disp('Section B')
% 3x3 Matrix input by use for loop
% matrix input must be written from left to right and up to down order
for i=1:3
    for j=1:3
        R(i,j)=input('user matrix input left to right, up to down ')
    end
end
ARB_1=reshape(R,3,3); %put the matrix into 3x3 array
%Rotation matrix to euler angles method 1: using built-in function
disp('Rotation matrix to euler angles method 1: using built-in function')
% Transfer to euler angles alpha beta gamma matrix with degrees
euler_angles=rad2deg(rotm2eul(ARB_1));
% Take the alpha out
alpha_1=euler_angles(1,1)
% Take the beta out
beta_1=euler_angles(1,2)
% Take the gamma out
gamma_1=euler_angles(1,3)
%Rotation matrix to euler angles method 2: using arctan
disp('Rotation matrix to euler angles method 2: using arctan')
% Calculate C_beta
C_beta=(sqrt(ARB_1(1,1)^2+ARB_1(2,1)^2));
%Calculate alpha
alpha=rad2deg(atan2((ARB_1(2,1)/C_beta),(ARB_1(1,1)/C_beta)))
%Calculate beta
beta=rad2deg(atan2(-ARB_1(3,1),C_beta))
%Calculate gamma
gamma=rad2deg(atan2((ARB_1(3,2)/C_beta),(ARB_1(3,3)/C_beta)))

%%Exercise 3C 
%Calculate AP=Ry*BP
%% Section 3C
disp('Section C')
% Calculate AP=Ry*BP
AP =roty(20,'deg')*[1;0;1]

