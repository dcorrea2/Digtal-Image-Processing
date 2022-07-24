function O = equalize_img(img)
% equalize_img Takes in a uint8 grayscale image matrix and output an image
%               transformed by histogram equalization.
%
% Syntax:
%   O = equalize_img(img)
%
% Input:
%   img = uint8 image matrix with values 0-255.
%
% Output:
%   O = uint8 image matrix with values 0-255.
%
% History:
%   D. Correa 4/9/2022 Created

    %Initialize our output matrix
    O = zeros(size(img,1),size(img,2), 'uint8');

    %Compute normalized histogram of input image and plot
    h = compute_histogram(img);
    figure = plot_histogram(h);

    %Get mean and standard deviation from original image
    img_vec = reshape(img, 1, []);
    img_vec = double(img_vec);
    Mean_Orig = mean(img_vec);
    SD_Orig = std(img_vec);

    %Transform normalized histogram
    T = histogram_transform(h);

    %Visit each pixel in input image and assign transformed pixed value
    % to output image
    for i = 1:size(img,1)
        for j = 1:size(img,2)
            O(i,j) = round( T( img(i,j) + 1 ));


        end
    end

    %Show and save image
    imshow(O);
    %imwrite(O, 'Dark_Image_Equalized.png');
    imwrite(O, 'Light_Image_Equalized.png');

    %Compute histogram and show plot of equalized image
    h_eq = compute_histogram(O);
    eq_figure = plot_histogram(h_eq);

    %Get mean and standard deviation from equalized images
    O_vec = reshape(O, 1, []);
    O_vec = double(O_vec);
    Mean_EQ = mean(O_vec);
    SD_EQ = std(O_vec);

    %saveas(eq_figure, 'Dark_EQ_Figure.png');
    saveas(eq_figure, 'Light_EQ_Figure.png');

end