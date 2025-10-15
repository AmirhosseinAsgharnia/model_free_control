function u = controller_paper(t,y)

g = 9.8; m = 0.5; M = 2; l = 0.5;

Kp_x = 0.05;  Kd_x = 0.05;

x_d = 0;


e_x = y(1) - x_d;
de_x = y(2);

theta_d = -(Kp_x*e_x + Kd_x*de_x);

rho_theta = @(t) (0.2 - 0.01)*exp(-5*t) + 0.01;
rho_y     = @(t) (0.6 - 0.01)*exp(-5*t) + 0.01;

rho_theta_dot = @(t) -5*(0.2 - 0.01)*exp(-5*t);
rho_y_dot     = @(t) -5*(0.6 - 0.01)*exp(-5*t);

alpha_theta = @(t) -rho_theta_dot(t) / rho_theta(t);
alpha_y     = @(t) -rho_y_dot(t) / rho_y(t);

lambda = 1;

e_theta = y(3) - theta_d;
e_y     = y(4) + lambda * e_theta;

T_dot = @(x) 2/(1-x^2);
T     = @(x) log((1 + x)/(1 - x));

e_bar_theta = e_theta/rho_theta(t);
e_bar_y     = e_y /rho_y(t);

Jf_theta = @(t,e_bar_theta) T_dot(e_bar_theta) / rho_theta(t);
Jf_y     = @(t,e_bar_y) T_dot(e_bar_y) / rho_y(t);

K_theta = 100;
K_y = 10;

J_t = Jf_theta(t,e_bar_theta);
T_t = T(e_bar_theta);

J_y = Jf_y(t,e_bar_y);
T_y = T(e_bar_y);

u = (K_theta*J_t*T_t + K_y*J_y*T_y)/8.5;
