function IP = mybilinear(PW_topL, PW_topR, PW_botL, PW_botR, inputImgRowPos, inputImgColPos, scale_rows, scale_cols)
% mybilinear Computes interpolated pixel value using 4 adjacent pixel
%            weights, location of interpolated pixel, and scale factors.
%
%Syntax:
%   IP = mybilinear(PW_topL, PW_topR, PW_botL, PW_botR, inputImgRowPos, 
%        inputImgColPos, scale_rows, scale_cols)
%
%Input:
%   PW_topL = Pixel wieght of pixel above and to the right of interpolated
%             pixel.
%   PW_topR = Pixel wieight of pixel above and to the right of interpolated
%             pixel.
%   PW_botL = Pixel wieight of pixel below and to the left of interpolated
%             pixel.
%   PW_botR = Pixel wieight of pixel below and to the right of interpolated
%             pixel.
%   inputImgRowPos = Relative row position of interpolated pixel from 
%                    original image.
%   inputImgColPos = Relative column position of interpolated pixel from 
%                    original image.
%   scale_rows = Scale factor between original row size and new row size.
%   scale_cols = Scale factor between original column size and new column
%                size.
%Output:
%   IP = Pixel weight of interpolated pixel.
%
%History:
%   D. Correa 3/18/2022 Created 
%   D. Correa 3/21/2022 Function completed
%   D. Correa 3/21/2022 Tested and fixed issues with location variables
%                       in p5_1 and p5_2.


    %Calculate position to scaled image
    y = round(inputImgRowPos*scale_rows);
    y1 = round((inputImgRowPos+1)*scale_rows);
    y2 = round((inputImgRowPos-1)*scale_rows);

    x = round(inputImgColPos*scale_cols);
    x1 = round((inputImgColPos-1)*scale_cols);
    x2 = round((inputImgColPos+1)*scale_cols);


    %Interpolate using intesities of 4 neighboring points
    p5_1 = ((x2-x) / (x2-x1)) * PW_botL + ((x-x1) / (x2-x1)) * PW_botR;
    p5_2 = ((x2-x) / (x2-x1)) * PW_topL + ((x-x1) / (x2-x1)) * PW_topR;
    IP = round(((y2-y) / (y2-y1)) * p5_1 + ((y-y1) / (y2-y1)) * p5_2);

    end