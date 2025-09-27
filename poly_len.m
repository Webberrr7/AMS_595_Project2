function L = poly_len(p, s, e)
% POLY_LEN  Arc length of y = polyval(p, x) over [s, e].
%   L = integral_s^e sqrt(1 + (f'(x))^2) dx
    dp = polyder(p);                          % coefficients of the derivative
    ds = @(x) sqrt(1 + (polyval(dp, x)).^2);  % integrand
    L  = integral(ds, s, e, 'RelTol', 1e-8, 'AbsTol', 1e-10);
end
