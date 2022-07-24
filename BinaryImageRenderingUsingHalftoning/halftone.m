%halftone: Converts a grayscale image to a binary image using
% black and white dot patterns to render a grayscale
% image.
%
%Syntax:
% output_img = halftone(image)
%
%Input:
% image = The grayscale image that will be rendered. Should
% be of type uint8 with values 0 to 255.
%
%Output:
% output_img = Binary output image that is of type uint8 and
%              contains values only 0 or 255.
%
%History:
%   D. Correa 2/15/2022 Created
%   D. Correa 2/21/2022 Added image size boundary
%   D. Correa 2/22/2022 Added average calculation
%                       and binary value selection.

function output_img = halftone(image)

    %get image size%
    [row,col] = size(image);

    %allocate output image and ensure it is the same size as input image
    output_img = uint8(ones(row,col));

    %take image size as float for average computation
    img_float = double(image);

    %will determine left over columns that will help make our output images
    %sizes multiples of 3
    row_edge = mod(row,3);
    col_edge = mod(col,3);

    %take the average of each 3x3 block and determine what binary value will be
    %associated with each block
    for i = 1:3:row-row_edge
        for j = 1:3:col-col_edge

            avg = mean(mean(img_float(i:i+2,j:j+2)));

            %assign binary value to 3x3 block
            if avg < 255/2
                output_img(i:i+2,j:j+2) = 0;
            else
                output_img(i:i+2,j:j+2) = 255;
            end
        end
    end
end