% PLOT_MANDELBROT_IMSHOW  Visualize inside/outside using imshow.
xs = linspace(-2, 2, 600);
ys = linspace(-1.5, 1.5, 400);

BW = false(numel(ys), numel(xs)); % true => inside
for ix = 1:numel(xs)
    for iy = 1:numel(ys)
        BW(iy, ix) = indicator(xs(ix), ys(iy), 100) > 0; % inside => 1
    end
end

imshow(BW, 'XData', [xs(1) xs(end)], 'YData', [ys(1) ys(end)]);
axis on; set(gca, 'YDir', 'normal');
colormap(gray);
title('Mandelbrot set (white = inside, black = outside)');
xlabel('x'); ylabel('y');
