# Mandelbrot Boundary — Arc Length Estimation (MATLAB)

This repository computes the arc length of a **smooth, single-valued segment** of the Mandelbrot set boundary using:
1) escape-time membership, 2) vertical-line **bisection** sampling of the boundary, and 3) a degree-15 **polynomial fit** with arc-length integration.

---

## Files / What they do  
fractal.m — escape-time counter for |z|>2.

indicator.m — membership indicator (inside = +1, outside = −1).

bisection.m — finds the boundary ordinate y=m(x) on a vertical line.

indicator_fn_at_x.m — helper that returns fn(y) = indicator(x,y).

sample_boundary.m — collects top-boundary samples (x_i, y_i) for x∈[-2,1].

poly_len.m — arc length of y = polyval(p,x) on [s,e].

plot_mandelbrot_imshow.m — binary inside/outside image (world coordinates).

plot_escape_imshow.m — escape-iteration “heatmap”.

fit_and_length.m — main script: sampling → degree-15 fit → arc length.


## Requirements
- **MATLAB** R2016b or later.
- No toolboxes required.  
  *Note:* If you don’t have Image Processing Toolbox for `imshow`, the scripts also work with `imagesc`.

Place all `.m` files in the **same folder** and `cd` into that folder in MATLAB.

---

## Quick Start
Open MATLAB and run:

```matlab
% Change to your project folder
cd('path/to/your/folder');

% (Optional) Preview the set
plot_mandelbrot_imshow;   % or: plot_escape_imshow

% One-click pipeline: sample -> fit -> length
fit_and_length

