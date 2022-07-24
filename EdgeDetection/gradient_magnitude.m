function gradient_output = gradient_magnitude(img)
% gradient_magnitude Takes an image matrix of type double and calls
%                    spatial_filter function to apply Sobel filter.
%
% Syntax:
%   gradient_output = gradient_magnitude(img)
%
% Input:
%   img = Image matrix of type double from grayscale image.
%
% Output:
%   gradient_output = Gradient output image matrix after applying Sobel
%                     filter.
%
% History:
%   D. Correa Created, tested and completed 4/25/2022

    %Sobel mask from figure 10.14 in the textbook
    sobel_filter = [-1,-2,-1; 0,0,0; 1,2,1];
    
    %Call spatial filter to generate gradient magnitude image using sobel mask
    %as filter.
    gradient_output = spatial_filter(img, sobel_filter);
    
end