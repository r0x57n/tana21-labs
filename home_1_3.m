format short e

x_star = 1/6;

f = @(x) 3*x - cos(2*pi*x);
fprime = @(x) 3 + 2*pi*sin(2*pi*x);

x0 = 0.4;
tol = 1e-09;

[xVals, iter] = newtonRaphson(f, fprime, x0, tol);
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
% x_k = 9.984045e-02,      f(x_k) = -5.100845e-01  |x* - x_k| = 6.682622e-02       EOC = 1.859193e+00
% x_k = 1.761083e-01,      f(x_k) = 8.055011e-02   |x* - x_k| = 9.441644e-03       EOC = 1.723286e+00
% x_k = 1.667617e-01,      f(x_k) = 8.021028e-04   |x* - x_k| = 9.500958e-05       EOC = 1.986334e+00
% x_k = 1.666667e-01,      f(x_k) = 8.900996e-08   |x* - x_k| = 1.054446e-08       EOC = 1.983221e+00
% x_k = 1.666667e-01,      f(x_k) = 1.110223e-15   |x* - x_k| = 1.387779e-16       EOC = 1.987931e+00
% Mean eoc: 1.589994e+00
