% For testing, ensure rows and images to be used are correct and inputs are
% valid.
%
% D. Correa 3/14/2022 Created
% D. Correa 3/18/2022 Added more commands for images to be read for
%                     testing.
% D. Correa 3/21/2022 Added more commands for testing RMSE function

    %Get image matrix from input image
    img_matrix = imread('Lab_02_image1.tif');
    %img_matrix = imread('40x75_Downsampled_NN.png');
    %img_matrix = imread('40x75_Downsampled_BN.png');
    %img_matrix = imread('425x600_UpSampled_NN.png');
    %img_matrix = imread('425x600_UpSampled_BN.png');

    %New size for resized image matrix
    %rows = 40;
    %cols = 75;
    %rows = 425;
    %cols = 600;
    rows = 300;
    cols = 300;

    %Declare interpolation method to be used
    %resize_type = "Nearest";
    resize_type = "Bilinear";

    %Generate output image using myimresize function
    %output = myimresize(img_matrix, rows, cols, resize_type);

    %Show and save returned image matrix
    %imshow(output, []);
    %imwrite(output, '40x75_Downsampled_NN.png');
    %imwrite(output, '425x600_UpSampled_NN.png');

    %imwrite(output, '300x300_Resized_Downsampled_NN.png');
    %imwrite(output, '300x300_Resized_Upsampled_NN.png');

    %img2 = imread('300x300_Resized_Downsampled_NN.png');
    img2 = imread('300x300_Resized_UpSampled_NN.png');
    %img2 = imread('300x300_Resized_Downsampled_BN.png');
    %img2 = imread('300x300_Resized_UpSampled_BN.png');

    RMSE = myRMSE(rows, cols, img_matrix, img2);
