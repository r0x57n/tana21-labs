format long

A = [0.913 0.659; 0.457 0.330];
b = [0.254; 0.127];

x_exact = [1; -1];
A*x_exact - b

x_num_initial = A\b

b_i = [0.2539949; 0.1272061];
b_hat = [0.2539949; 0.1272061];
b_tilde = [0.252428; 0.126213];

x_hat = A\b_hat
x_tilde = A\b_tilde

r_hat = b - A*x_hat;
r_tilde = b - A*x_tilde;

norm(r_hat, 1)
norm(r_tilde, 1)

k_1 = cond(A,1)
