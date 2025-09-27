function fn = indicator_fn_at_x(x, maxIter)
% INDICATOR_FN_AT_X  Return a function of y for a fixed x.
%   fn(y) = indicator(x, y, maxIter)
    if nargin < 2, maxIter = 100; end
    fn = @(y) indicator(x, y, maxIter);
end
