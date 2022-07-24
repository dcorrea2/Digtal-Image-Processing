function output_img = spatial_filter(img, filter)
% spatial_filter Applies a spatial filter to an image matrix by
%                examening the image and filter size, then creating
%                a window to apply the filter over a certain area
%                of pixels in the image.
%
% Syntax:
%   output_img = spatial_filter(img, filter)
%
% Input:
%   img = Image matrix of type double taken from grayscale image.
%
%   filter = Filter to be used. Must be a matrix.
%
% Output:
%   output_img = Image matrix generated after applying spatial filter
%
% History:
%   D. Correa Created 4/20/2022
%   D. Correa Tested and completed 4/25/2022

    % Pad image matrix with zeros for boundry issues
    padded_img = padarray(img, [1,1], 0, 'both');
    
    % Get dimensions from filter and image to be used to compute position of
    % filter window applied onto image.
    filter_size = size(filter);
    img_size = size(padded_img);
    
    % Define size of output image
    output_img = zeros(img_size(1) - (filter_size(2) - 1), img_size(2) - filter_size(2) - 1);
    
    % Define filter window size
    start_row = (filter_size(2) + 1) / 2;
    start_col = (filter_size(2) + 1) / 2;
    end_row = img_size(1) - ( (filter_size(2)-1) / 2);
    end_col = img_size(2) - ( (filter_size(2)-1) / 2);
    
    % Apply filter window to padded image
    for i = start_row : end_row
        for j = start_col : end_col
            
            % Set window to be the center pixel, [i,j], and its surrounding
            % pixels. Output image is the sum of applying the filter to each
            % pixel in the window.
            window = padded_img(i - ((filter_size(2)-1)/2): i + ((filter_size(2)- 1)/2), j - ((filter_size(2)-1)/2): j + ((filter_size(2)-1)/2));
            output_img(i - ((filter_size(2)-1)/2), j - ((filter_size(2)-1)/2)) = sum( window .* filter, 'all');
        end
    end
end