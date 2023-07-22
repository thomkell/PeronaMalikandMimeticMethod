% Perona Malik Equation with mimetic method
% Thomas Keller, COMP670, Project
clc; clear; close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mole
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath('../mole_MATLAB')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read lena image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RGB = imread('lena_color.jpg');

RGB = imcrop(RGB,[0 0 512 512]);

% BC Neumann (add before noise)
RGB = padarray(RGB,[1 1],255,'both');
IRGB2(1,:) = RGB(2,:);
RGB(end,:) = RGB(end-1,:);
RGB(:,1) = RGB(:,2);
RGB(:,end) = RGB(:,end-1);   

% add nois to image
RGB = imnoise(RGB,'gaussian');

% Read and display an RGB image, and then convert it to grayscale
I = rgb2gray(RGB);

% convert integer values to double
IX = double(I)+1;

% I = imcrop(X,map,[240 240 39 39]); % [xmin ymin width height]
% I = imcrop(X,map,[250 250 19 19]); % [xmin ymin width height]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define mimetic operators
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 2;   % Order of accuracy
m = 512;  % Number of cells along the x-axis
n = m;   % Number of cells along the y-axis
a = 0;   % West
b = 512;   % East
c = 0;   % South
d = 512;   % North 
dx = (b-a)/m;
dy = (d-c)/n;

% 2D Staggered grid
xgrid = [a a+dx/2 : dx : b-dx/2 b];
ygrid = [c c+dy/2 : dy : d-dy/2 d];

% 2D Mimetic divergence operator
D = div2D(k, m, dx, n, dy);

% 2D Mimetic gradient operator
G = grad2D(k, m, dx, n, dy);

% alpha
alpha = 1;

% Check neumann stability
% Neumann stability criterion
% dt = 0.1
dt = dx^2/(10*alpha); % alpha = 1

% IC
I2 = IX; % Initial condition image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iteration-Loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for t = 1 : 30

    % create vector with image data
    I2  = reshape(I2, [], 1);
    
    % gradient of the image
    I3 = G*I2;

    % Diffusion coefficient
    % C caluclation
    k = 7;
    C = 1./(1+(I3./k).^2);

    % Operation
    L1 = C.*I3;
    L = I2 + dt*(D*L1);

    % reshape vector to image 
    I2=reshape(L, 514, 514);
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% convert image back to uint8 
I2=uint8((I2-1));

% Output
figure
subplot(1,2,1)
imshow(I)
title('Original Image')
subplot(1,2,2)
imshow(I2)
title('Perona Malik Image')
