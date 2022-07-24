function edge_img = find_edges(img, scalar)
% find_edges Generate image matrix showing edges detected from gradient
%            image enhanced by threshold scalar.
%
% Syntax:
%   edge_img = find_edges(img, scalar)
%
% Input:
%   img = Image matrix of type double taken from grayscale image.
%
% scalar = Threshold scalar value to determine sensitivity of which edges
%          are detected.
%
% Output:
%   edge_image = Output image showing detected edges
%
% History:
%   D. Correa Created, tested and completed. 4/25/2022
%

    %Get gradient image from gradient magnitude
    gradient_output = gradient_magnitude(img);
    
    % Apply threshold to each value in gradient image
    edge_img = gradient_output .* scalar;
    
    % Convert double edge_img to uint8.
    edge_img = uint8(edge_img);
    
end