%% Clear & Close all 
clear all
close all
clc

%% Import Data
max_dist = 400; % (mm)
M = dlmread('map_data.txt');
max_index = M(:,2) > max_dist;
M(max_index,2) = max_dist;
% Tranforming data to x-y plane
x_pt = M(:,2).*cosd(M(:,1));
y_pt = M(:,2).*sind(M(:,1));
% Plot the full map
map_title = 'Point-to-point map';
figure('Name',map_title);       
plot(x_pt,y_pt);


%% Dataset separation

% ------- Segment 1 ------- %
% Used in RANSAC

% Data extracting
start_i = 120;
end_i = 130;
data_size1 = end_i-start_i+1;
x1_pt = x_pt(start_i:end_i);
y1_pt = y_pt(start_i:end_i);

% Plot
map_title = 'Segment 1';
figure('Name',map_title);       
plot(x1_pt,y1_pt);
% To limit view of the graph
edge = 0.1;
xlim([min(x1_pt)-edge*min(x1_pt) max(x1_pt)+edge*min(x1_pt)]);
ylim([min(y1_pt)-edge*min(y1_pt) max(y1_pt)+edge*min(y1_pt)]);

% Concatenate 2 arrays 
points=[x1_pt,y1_pt];

%% RANSAC
% If not see the least square fit, run this section seperately again
% Ref https://www.mathworks.com/help/vision/ref/ransac.html
% Plot points
map_title = 'RANSAC';
figure('Name',map_title); 
plot(points(:,1),points(:,2),'o');
hold on

% Fit a line using linear least squares. 
% Due to outliers, the line is not a good fit.
modelLeastSquares = polyfit(points(:,1),points(:,2),1);
x = [min(points(:,1)) max(points(:,1))];
y = modelLeastSquares(1)*x + modelLeastSquares(2);
plot(x,y,'r-')

% Define the sample size, the maximum distance for inliers
sampleSize = 2; % number of points to sample per trial
maxDistance = 2; % max allowable distance for inliers

% Define the the fit function, and the distance evaluation function
fitLineFcn = @(points) polyfit(points(:,1),points(:,2),1); % fit function using polyfit
evalLineFcn = ...   % distance evaluation function
  @(model, points) sum((points(:, 2) - polyval(model, points(:,1))).^2,2);

% Call ransac to run the MSAC algorithm
[modelRANSAC, inlierIdx] = ransac(points,fitLineFcn,evalLineFcn, ...
  sampleSize,maxDistance);

% Refit a line to the inliers using polyfit.
modelInliers = polyfit(points(inlierIdx,1),points(inlierIdx,2),1);

% Display the final fit line. This line is robust to the outliers that ransac identified and ignored.
inlierPts = points(inlierIdx,:);
x = [min(inlierPts(:,1)) max(inlierPts(:,1))];
y = modelInliers(1)*x + modelInliers(2);
plot(x, y, 'g-')
legend('Noisy points','Least squares fit','Robust fit');
hold off
