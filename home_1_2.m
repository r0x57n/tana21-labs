n_values = 7:12;

absolute_error = zeros(1, length(n_values));
relative_error = zeros(1, length(n_values));

for i = 1:length(n_values)
    n = n_values(i);

    exact_value = factorial(n);
    approximate_value = sqrt(2*pi*n)*(n/exp(1))^n;

    absolute_error(i) = abs(exact_value - approximate_value);

    relative_error(i) = absolute_error(i) / abs(exact_value);

    fprintf('n = %d: n! = %.5e, Stirlings approximation = %.5e, Absolute error = %.5e, Relative error = %.5e\n', ...
             n, exact_value, approximate_value, absolute_error(i), relative_error(i));
end

% n = 7:    n! = 5.04000e+03, Stirlings approximation = 4.98040e+03, Absolute error = 5.96042e+01, Relative error = 1.18262e-02
% n = 8:    n! = 4.03200e+04, Stirlings approximation = 3.99024e+04, Absolute error = 4.17605e+02, Relative error = 1.03573e-02
% n = 9:    n! = 3.62880e+05, Stirlings approximation = 3.59537e+05, Absolute error = 3.34313e+03, Relative error = 9.21276e-03
% n = 10:   n! = 3.62880e+06, Stirlings approximation = 3.59870e+06, Absolute error = 3.01044e+04, Relative error = 8.29596e-03
% n = 11:   n! = 3.99168e+07, Stirlings approximation = 3.96156e+07, Absolute error = 3.01175e+05, Relative error = 7.54507e-03
% n = 12:   n! = 4.79002e+08, Stirlings approximation = 4.75687e+08, Absolute error = 3.31411e+06, Relative error = 6.91879e-03
