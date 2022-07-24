function figure = plot_histogram(h)
% plot _histogram Creates a histogram plot from normalized histogram
%
% Syntax:
%   figure = plot_histogram(h)
%
% Input:
%   h = computed normalized histogram vector. Contains only values 0 - 1
%       of which should sum to 1.
%
% Output:
%   figure = histogram plot
%
% History:
%   D. Correa 4/9/2022 Created

    %Using built in function to plot histogram
    figure = bar(h);

end
