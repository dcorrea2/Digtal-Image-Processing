function [theta_out, rho_out, accumulator] = hough_transform(i_edge)
% hough_transform     Takes in a black and white edge line image and
%                     returns the distance from origin of the line, 
%                     its angle of orientation, and an accumulator matrix 
%                     representing the detection of the line at an
%                     orientation.
%
% Syntax:
%   [theta_out, rho_out, accumulator] = hough_transform(i_edge)
%
% Input:
%   i_edge = Edge image consisting only of pixel intensities 0 and 255.
%
% Output:
%   theta_out = Estimated angle orientation of the detected line.
%   
%   rho_out = Estimated distance from origin to the detected line.
%
%   accumulator = Accumulator matrix containing the votes at each index of
%                 rho and theta that determines if edge point is part of the 
%                 line.
%
% History:
%           D. Correa   Created     5/7/2022
%           D. Correa   Completed   5/9/2022


[size_x, size_y] = size(i_edge);

%Compute diagonal size of image i_edge
size_d = ceil(sqrt(size_x^2 + size_y^2));
 
accumulator = zeros(floor(2*size_d), 180);

%Since we cant perform -89:90 in a loop we will set our inital degree now
%account for this issue in our loop declaration. (init_degree + k - 1)
init_degree = -89;

%Rho gives non integer values so we have to use some index to keep track of
%votes in accumulator
for i = 1:floor((2*size_d+1));
    index(i) = round(-size_d + i -1);
end

for i = 1:size_x
    for j = 1:size_y
        
        %Check for edge point
        if(i_edge(i,j) == 255)
            
            for k = 1:180
                
                %Compute rho using line normal form equation
                rho = i * cosd(init_degree + k -1) + j * sind(init_degree + k -1);
                
                ind = find(index == round(rho));
                
                %Accumulate votes
                accumulator(ind,k) = accumulator(ind,k) + 1;
            end
        end
    end
end

%Accumulator with most votes
[m,indx] = max(accumulator(:));

%Return index values
[rho_out, theta_out] = ind2sub(size(accumulator),indx);

%Adjust for range of rows and theta
rho_out = rho_out - size_d;
theta_out = theta_out - 90;

end