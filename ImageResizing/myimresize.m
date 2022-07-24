function [output] = myimresize(img_matrix, rows, cols, resize_type)
% myresize The function should take in an image matrix, the number of
%          rows and colums the image should be resized too and a
%          string of what method of interpolation to be used, Nearest
%          or Bilinear.
%
%Syntax:
%   output = myimresize(img_matrix, rows, cols, resize_type)
%
%Input:
%   img_matrix = Matrix gathered from input image
%   rows = # of rows for new image size
%   cols = # of columns for new image size
%   resize_type = Method of interpolation (Select either Nearest or
%                 Bilinear)
%
%History:
%   D. Correa 3/14/2022 Created
%   D. Correa 3/18/2022 Completed Nearest Neighbor Function
%   D. Correa 3/21/2022 Completed Bilinear Function
%   D. Correa 3/21/2022 Tested and fixed out of bound erros
%

    %Nearest Neighbor Section
    if resize_type == "Nearest"
        %Create empty output matrix
        % and find scaling factor for rows and colums
        output = zeros([rows,cols],'uint8');
        resize_factor_rows = rows/size(img_matrix,1);
        resize_factor_cols = cols/size(img_matrix,2);

        %Ensure interpolation method is correct
        for i = 1:rows
            for j = 1:cols
                %for each pixel in output, assign intensity from nearest
                %neigbor
                if (i/resize_factor_rows) < rows && (j/resize_factor_cols) <
                    cols
                    output(i,j) = img_matrix(round(i/resize_factor_rows),
                    round(j/resize_factor_cols));
                end
            end
        end

    end


    %Bilinear Interpolation Section


    if resize_type == "Bilinear"
        %Create empty matrix for output image
        B = zeros([rows,cols], 'uint8');
        %Get factors of how the rows and columns are scaled from original image
        scale_rows = rows/size(img_matrix,1);
        scale_cols = cols/size(img_matrix,2);
        %To keep from out of bound cases, begin iteration at 3 and end at max
        %num rows/cols - 3.
        %Values < 3 result in out of bound errors.
        for i = 3:rows-3
            for j = 3:cols-3

                %Get equivalent positions from original image
                inputImgRowPos = round(i/scale_rows);
                inputImgColPos = round(j/scale_cols);


                %Get pixel intensities from 4 surrounding pixels
                PW_topL = img_matrix(inputImgRowPos+1,inputImgColPos-1);
                PW_topR = img_matrix(inputImgRowPos+1,inputImgColPos+1);
                PW_botL = img_matrix(inputImgRowPos-1,inputImgColPos-1);
                PW_botR = img_matrix(inputImgRowPos-1,inputImgColPos+1);

                %Call mybilinear function to get intensity value of
                %interpolated pixel
                IP = mybilinear(PW_topL, PW_topR, PW_botL, PW_botR, inputImgRowPos, inputImgColPos, scale_rows, scale_cols);

                %Assign interpolated pixel intensity to location scaled image
                B(i,j) = IP;

            end
        end

        %Show and save returned image matrix from bilinear interpolation
        imshow(B, []);
        %imwrite(output, '40x75_Downsampled_BN.png');
        %imwrite(output, '425x600_UpSampled_BN.png');


        %imwrite(B, '300x300_Resized_Downsampled_BN.png');
        %imwrite(B, '300x300_Resized_Upsampled_BN.png');

    end

end
