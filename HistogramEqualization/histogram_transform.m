function T = histogram_transform(h)
% histogram_transform Compute transformed histogram vector filled with
%                     equalized pixel intensites for equalized image
%
% Syntax: 
%   T = histogram_transform(h)
%
% Input:
%   h = computed normalized histogram vector. Contains only values 0 - 1
%       of which should sum to 1.
%
% Output:
%   T = transformed histogram vector. 
%
 
    %Initialize transformation vector T
    T = zeros(1,256);
 
    %Using equation 3-15 from textbook
    %L = 255
    %h = p(r)
    sum = 0;
    
    %Take summation first of normalized histogram
    for k = 1:256
        T(k) = sum + h(k);
        sum = T(k);
    end
    
    %Multiply by L, the number of possible pixel intesities
    for l = 1:256
        T(l) = 255 * T(l);
    end
end
