function it = fractal(c, maxIter)
% FRACTAL takes complex c and returns the number of iterations till divergence
    if nargin < 2, maxIter = 100; end
    z = 0;
    it = 0;
    while it < maxIter && abs(z) <= 2
        z = z^2 + c; 
        it = it + 1;
    end
end