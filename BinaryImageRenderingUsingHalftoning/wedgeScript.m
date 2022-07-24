%create a matrix of zeros size 256x256%
wedge = zeros(256,256);

%fill each row starting with row 1 with a value 0 to 255
for i = 1:256
    for j = 1:256
        wedge(i,j) = i-1;
    end
end

%show create wedge matrix%
imshow(wedge,[]);
imwrite(uint8(wedge), "Wedge.tif");

%set wedge matrix as image matrix to be used in halftone function
image = wedge;

%call function
output_img = halftone(image);

%show and save output image%
imshow(output_img);
imwrite(output_img, "Wedge_Halftone.tif");
