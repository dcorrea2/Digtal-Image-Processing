function h = compute_histogram(img)
% compute_histogram Computes a histogram of an input image by counting
%                   occurences of pixel values and computing the difference
%                   of the count and total number of pixels of the input 
%                   image
%
% Syntax:
%   h = compute_histogram(img)
%
% Input:
%   img = uint8 matrix from an image
%
% Output:
%   h = computed normalized histogram vector. Contains only values 0 - 1
%   of which should sum to 1.
%
% History:
%   D. Correa 4/9/2022 Created


    % Initialize output h as vector
    h = zeros(1,256);
 
    %Count number of times each pixel value 0-255
    for i = 1:size(img,1)
        for j = 1:size(img,2)
 
        %Get pixel value from matrix and increment index of vector for
        % each time pixel value is found
        %Must account for vector beginning at 1 instead of 0.
        pixel_val = img(i,j); 
        h(pixel_val+1) = h(pixel_val+1) + 1;
        end
    end
 
    %Get M by N size of image
    total_pixels = size(img,1) * size(img,2);
 
    %Used to check if values in vector will sum to 1
    sum = 0;
 
    %Divide number of times pixel values occured by total number of pixels
    for k = 1:256
        h(k) = h(k) / total_pixels;
        sum = sum + h(k);
    end
 
 
end
