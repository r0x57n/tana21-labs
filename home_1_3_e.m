format short e

x_star = 1/6;

f = @(x) 3*x - cos(2*pi*x);
fprime = @(x) 3 + 2*pi*sin(2*pi*x);

x0 = 0.4;
tol = 1e-09;

[xVals, iter] = steffensen(f, fprime, x0, tol);
eocs = zeros(1, length(xVals));

for i = 1:length(xVals)
    if i == 1
        fprintf("x_k = %d,\t f(x_k) = %d\t |x* - x_k| = %d\n", ...
                xVals(i), f(xVals(i)), abs(x_star - xVals(i)));
    else
        eocs(i) = log(abs(x_star - xVals(i)))/log(abs(x_star - xVals(i-1)));
        fprintf("x_k = %d,\t f(x_k) = %d\t |x* - x_k| = %d\t EOC = %d\n", ...
                xVals(i), f(xVals(i)), abs(x_star - xVals(i)), eocs(i));
    end
end

fprintf("Mean eoc: %d\n", mean(eocs));

% x_k = 4.000000e-01,      f(x_k) = 2.009017e+00   |x* - x_k| = 2.333333e-01
% x_k = -2.661372e-01,     f(x_k) = -6.971923e-01  |x* - x_k| = 4.328038e-01       EOC = 5.754676e-01
% x_k = -1.126247e-01,     f(x_k) = -1.097771e+00  |x* - x_k| = 2.792914e-01       EOC = 1.523038e+00
% x_k = 3.209121e-01,      f(x_k) = 1.393694e+00   |x* - x_k| = 1.542455e-01       EOC = 1.465473e+00
% x_k = -1.682693e-01,     f(x_k) = -9.960621e-01  |x* - x_k| = 3.349360e-01       EOC = 5.851754e-01
% x_k = 1.613906e-01,      f(x_k) = -4.425717e-02  |x* - x_k| = 5.276039e-03       EOC = 4.794756e+00
% x_k = 1.670594e-01,      f(x_k) = 3.317088e-03   |x* - x_k| = 3.927747e-04       EOC = 1.495310e+00
% x_k = 1.666683e-01,      f(x_k) = 1.409996e-05   |x* - x_k| = 1.670331e-06       EOC = 1.696254e+00
% x_k = 1.666667e-01,      f(x_k) = 2.599597e-10   |x* - x_k| = 3.079581e-11       EOC = 1.819482e+00
% Mean eoc: 1.550551e+00
