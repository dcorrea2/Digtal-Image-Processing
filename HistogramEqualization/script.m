%Script to run all functions. Change image to be used when necessary.
%
% History:
%   D. Correa 4/9/2022 Created

    %Read images from directory
    img = imread('Lab_03_image1_dark.tif');
    img2 = imread('Lab_03_image2_light.tif');
    
    %Compute normalized histogram
    h = compute_histogram(img);

    %Plot normalized histogram
    figure = plot_histogram(h);

    %Save figures
    %saveas(figure, 'Dark_Imgage_Figure.png');
    %saveas(figure, 'Light_Imgage_Figure.png');

    %Transform normalized histogram
    T = histogram_transform(h);

    %Equalize the images and compare with original data.
    O = equalize_img(img);