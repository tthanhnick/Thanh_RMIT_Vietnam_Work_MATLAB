%%Nguyen Tien Thanh -S3818111
clearvars
close all
clc
%%Exercise 4A
%Section 1 alpha=10 beta=20 gamma=30 and APB=[1,2,3]'
%Calculate transformation matrix
%ATB=ARB*BP
%% Section A
disp('Exercise 4')
disp('Section A')
disp('section i')
disp('alpha=10 beta=20 gamma=30')
% Transformation matrix=ARB*BP
ATB1=transl(1,2,3)*(trotz(10,'deg')*troty(20,'deg')*trotx(30,'deg'))
%Section 2 beta=20 and APB=[1,0,1]'
%Calculate transformation matrix
%ATB=ARB*BP
disp('section ii')
disp('beta=20')
% Transformation matrix=ARB*BP
ATB2=transl(3,0,1)*troty(20,'deg')

%%Exercise 4B
%Calculate AP=ATB*APB
%Sketch results based on section 2
%%Section B
disp('section B')
disp('Plot graph')
%Set boundary for the 3D plots from -1 to 4
plotvol([-1 4 -1 4 -1 4])
%translation [3;0;1]
T=transl(3,0,1);
%plot the graph with green frame 1
trplot(T, 'frame', '1', 'color', 'r') 
%rotation 20 degree
ARB=troty(20,'deg');
%plot the graph with blue frame 2
trplot(ARB, 'frame', '2', 'color', 'b') 
%transformation function
ATB=transl(3,0,1)*troty(20,'deg'); 
%plot the graph with green frame 3
trplot(ATB, 'frame', '3', 'color', 'g')
view([-40 40]) % View from -40 to 40

% Calculate AP relative to BP=[1;0;1]
disp('Calculate AP')
AP=ATB*[1;0;1;1]

%Exercise 4C 
%Use matlab function and calculation to compare the inverse results by using identity matrix
%ATB=TBA^-1=ARB',-ARB'*APB
%Section 1 alpha=10 beta=20 gamma=30
%% Section C
disp('Section C')
disp('section i')
disp('alpha=10 beta=20 gamma=30')
% Transformation matrix
ATB_1=transl(1,2,3)*(trotz(10,'deg')*troty(20,'deg')*trotx(30,'deg'));

% Inverse using built in function inv
ATB_inverse_1=inv(ATB_1)

% Inverse using symbolic fomula ATB=TBA^-1=ARB',-ARB'*APB
BRA_1 = ATB_1(1:3,1:3); APBorg_1 = ATB_1(1:3,4);
BTA_1 = [BRA_1' -BRA_1'*APBorg_1; 0 0 0 1]

% Check answer by using identity matrix
identity_BTA_1=ATB_1*BTA_1
identity_ATB_inverse_1=ATB_1/ATB_1 
%Section 2 beta=20
disp('section ii')
disp('beta=20')
% Transformation matrix
ATB_2=transl(3,0,1)*troty(20,'deg');

% Inverse using built in function
ATB_inverse_2=inv(ATB_2)

% Inverse using symbolic fomula
BRA_2 = ATB_2(1:3,1:3); APBorg_2 = ATB_2(1:3,4);
BTA_2 = [BRA_2' -BRA_2'*APBorg_2; 0 0 0 1]

% Check answer by using identity matrix
identity_BTA_2=ATB_2*BTA_2
identity_ATB_inverse_2=ATB_2/ATB_2

%%Exercise 4D
%Calculation transformation matrix knowing others parameter T
%% Section D
disp('Section D')
% Calculation of the transformation matrix from the previous exercise
ATB=transl(1,2,3)*(trotz(10,'deg')*troty(20,'deg')*trotx(30,'deg'))
BTC=transl(3,0,1)*troty(20,'deg')
%Section 1 Calculate ATC from results above
% Calculate ATC
ATC=ATB*BTC
%Section 2 Calculate ATB based on ATC from previous calculation and BTC from previos calculation
% Calculate ATB based on ATC from previous calculation and BTC
ATB_unknown=ATC/BTC
%Section 3 Calculate BTC based on ATB from previous calculation and ATC from previous calculation
% Calculate BTC based on ATB from previous calculation and ATC
BTC_unknown=ATB_unknown\ATC
