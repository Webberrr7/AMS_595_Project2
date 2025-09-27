% FIT_AND_LENGTH  Sample boundary -> fit degree-15 polynomial -> arc length.

% 1) Sample top boundary points
[x_data, y_data] = sample_boundary(1200, 0, 1.5, 100);

% Quick look to choose a clean x-interval
figure; plot(x_data, y_data, '.'); axis equal; grid on;
title('Top boundary samples'); xlabel('x'); ylabel('y');

% 2) Pick a clean interval by looking at the scatter plot
xmin = -1.4;   % adjusted based on plot
xmax =  0.25;   

sel   = (x_data >= xmin) & (x_data <= xmax);
x_fit = x_data(sel);
y_fit = y_data(sel);

% 3) Degree-15 polynomial fit
deg = 15;
p   = polyfit(x_fit, y_fit, deg);

% 4) Visual check of the fit
xx = linspace(xmin, xmax, 1000);
yy = polyval(p, xx);

figure;
plot(x_fit, y_fit, '.', 'DisplayName', 'samples'); hold on;
plot(xx, yy, '-',  'DisplayName', sprintf('polyfit deg=%d', deg));
axis equal; grid on; legend('Location','best');
title(sprintf('Fit on [%.3f, %.3f]', xmin, xmax));
xlabel('x'); ylabel('y');

% 5) Arc length on [xmin, xmax]
L = poly_len(p, xmin, xmax);
fprintf('Arc length on [%.6f, %.6f] = %.10f\n', xmin, xmax, L);
