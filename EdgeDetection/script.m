%Script to call and get all images from all functions

%Get image matrix frim image
img = imread('watertower.tif');

%Convert uint8 matrix to double
img = im2double(img);

%Set filter
filter = ones(9)/81;

%Call spatial filter function
output_img = spatial_filter(img, filter);

%Show and save image from spatial filter function
imshow(output_img);
imwrite(output_img, 'LowPassFilterImg.png');

%Call gradient magnitude funtion
gradient_output = gradient_magnitude(img);

%Show and save image from gradient magnitude function
imshow(gradient_output);
imwrite(gradient_output, 'GradientImg.png');

%Set threshold for find_edges and call function
scalar = 800;
edge_img = find_edges(img, scalar);

%Show and save edge images
imshow(edge_img);
imwrite(edge_img,'watertower_edges.png');

% Use built in Canny edge detection to compare with written function
canny_img = edge(img, 'Canny');
imshow(canny_img);
imwrite(canny_img, 'CannyImg.png');