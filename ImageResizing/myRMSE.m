function RMSE = myRMSE(rows, cols, img1, img2)
% RMSE Compares image reconstruction accuracy between original image and
%      scaled images.
%
%Syntax: 
%   RMSE = myRMSE(rows,cols,img1,img2)
%
%Input:
%   rows = # of rows in original image matrix.
%   cols = # of colums in original image matrix.
%   img1 = Resized scaled image. 
%   img2 = Orignial image
%
%Output:
%   RMSE = float value that shows accuracy or resized image to original
%   image.
%
%History:
%   D. Correa 3/21/2022 Created, completed and tested.


    total = double(0);
    for i = 1:rows
        for j = 1:cols
            %Get sum of difference between image pixel intensities
            SQ = double((img1(i,j)-img2(i,j)));
            total = total + SQ^(2);
        end
    end
    %Calculate accuracy value.
    RMSE = sqrt((1/(rows*cols)*total));
end