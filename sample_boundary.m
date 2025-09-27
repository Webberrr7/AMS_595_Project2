function [x_data, y_data] = sample_boundary(nX, y_in, y_out, maxIter)
% SAMPLE_BOUNDARY  Sample the top boundary points (x, y) for x in [-2, 1].
%   - nX     : number of x-samples (default 1200)
%   - y_in   : lower y to test "inside" (default 0)
%   - y_out  : initial upper y to test "outside" (default 1.5)
%   - maxIter: max iterations for Mandelbrot test (default 100)
%
%   For each x, only proceed if indicator(x, y_in) > 0 (inside).
%   Then ensure an upper bound yhi with indicator(x, yhi) < 0 (outside),
%   searching upward if necessary. Finally, bisection finds the boundary.

    if nargin < 1 || isempty(nX),      nX = 1200; end
    if nargin < 2 || isempty(y_in),    y_in = 0;  end
    if nargin < 3 || isempty(y_out),   y_out = 1.5; end
    if nargin < 4 || isempty(maxIter), maxIter = 100; end

    xs = linspace(-2, 1, nX);
    ys = nan(size(xs));

    for i = 1:numel(xs)
        x = xs(i);

        % Require y_in to be inside (+1)
        if indicator(x, y_in, maxIter) <= 0
            continue;
        end

        % Find an upper bound yhi that is outside (-1). If not, search upwards.
        yhi = y_out;
        if indicator(x, yhi, maxIter) >= 0
            yy = yhi;
            while yy <= 2.0 && indicator(x, yy, maxIter) >= 0
                yy = yy + 0.1;
            end
            if yy > 2.0
                % could not secure an outside upper bound; skip this x
                continue;
            end
            yhi = yy;
        end

        fn     = indicator_fn_at_x(x, maxIter);
        ys(i)  = bisection(fn, y_in, yhi);
    end

    mask   = ~isnan(ys);
    x_data = xs(mask);
    y_data = ys(mask);
end
