% Script for testing RMSE values of Bilinear interpolation
%
% History:
%   D. Correa 3/21/2022 Created
%

    orig = imread('Lab_02_image1.tif');

    %img1 = imread('40x75_Downsampled_BN.png');
    %img2 = imread('425x600_UpSampled_BN.png');

    %A = imresize(img1, [300,300], 'Method','bilinear');
    %imwrite(A, '300x300_Resized_Downsampled_BN.png');

    %B = imresize(img2, [300,300], 'Method','bilinear');
    %imwrite(B, '300x300_Resized_UpSampled_BN.png');

    %img = imread('300x300_Resized_Downsampled_BN.png');
    img = imread('300x300_Resized_UpSampled_BN.png');

    RMSE = myRMSE(300,300,img,orig);