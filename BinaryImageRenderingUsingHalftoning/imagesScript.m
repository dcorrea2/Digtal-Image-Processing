%take in images
face = imread('Fig0225(a)(face).tif');
cameraman = imread('Fig0225(b)(cameraman).tif');
crowd = imread('Fig0225(c)(crowd).tif');

%image to be used for function
image = face;

%call function
output_img = halftone(image);

%show output image
imshow(output_img);

%save images
imwrite(output_img, "Face_Halftone.tif");
%imwrite(output_img, "Cameraman_Facetone.tif");
%imwrite(output_img, "Crowd_Facetone.tif");