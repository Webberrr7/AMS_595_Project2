function s = indicator(x, y, maxIter)
% indicator to show the point (x,y) is in the Mandelbrot set or not: in = 1
% ,out = -1
    if nargin < 3, maxIter =100; end
    it = fractal(complex(x,y),maxIter);
    if it < maxIter
        s = -1; % Point is outside the Mandelbrot set
    else
        s = 1; % Point is in the Mandelbrot set
    end
end