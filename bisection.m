function m = bisection(fn_f, s, e)
% BISECTION  Find boundary y = m along a vertical line by bisection.
%   m = bisection(fn_f, s, e)
%   - fn_f : handle of a scalar function of y. It must return:
%            inside -> 1 , outside -> -1 
%   - s    : lower y (must be inside => fn_f(s) > 0)
%   - e    : upper y (must be outside => fn_f(e) < 0)
%
%   The function shrinks [s, e] until the interval is below tolerance.

    tol      = 1e-6;  % stop when (e - s) < tol
    maxSteps = 60;    
    
    fs = fn_f(s);
    fe = fn_f(e);
    assert(fs > 0 && fe < 0, ...
        'Endpoints must bracket boundary: fn_f(s)>0 (inside), fn_f(e)<0 (outside).');

    for k = 1:maxSteps
        m  = 0.5*(s + e);
        fm = fn_f(m);

        if fm == 0
            return; % exact boundary hit (rare)
        elseif fm > 0
            % midpoint is inside -> lift the lower bound up to m
            s = m;  fs = fm;
        else
            % midpoint is outside -> push the upper bound down to m
            e = m;  fe = fm;
        end

        if (e - s) < tol
            m = 0.5*(s + e);
            return;
        end
    end

    % Fallback return
    m = 0.5*(s + e);
end
