clear; clc

figure;
set(1,"DefaultAxesFontName","times new roman");
set(1,"DefaultAxesFontSize",12);
set(1,"units","inches","pos",[0 0 6 8])
%% Non-linear

T_max=20;

t = [0 T_max];
y0 = [0 0 0.1 0];

u = 0;

[t,y] = ode45(@(t,y) nonlinfcn(t,y,controller_paper(t,y)), t, y0);

subplot(3,2,1)
plot(t,y(:,1))
grid minor
xlabel("Time (s)"); ylabel("$$x(t) (m)$$","Interpreter","latex")
title("$$x$$","Interpreter","latex")
xlim([0 T_max])

subplot(3,2,2)
plot(t,y(:,3))
grid minor
xlabel("Time (s)"); ylabel("$$\theta(t) (rad)$$","Interpreter","latex")
title("$$\theta$$","Interpreter","latex")
xlim([0 T_max])


subplot(3,2,3)
plot(t,y(:,2))
grid minor
xlabel("Time (s)"); ylabel("$$\dot{x}(t) (m/s)$$","Interpreter","latex")
title("$$\dot{x}$$","Interpreter","latex")
xlim([0 T_max])

subplot(3,2,4)
plot(t,y(:,4))
grid minor
xlabel("Time (s)"); ylabel("$$\dot{\theta}(t) (rad/s)$$","Interpreter","latex")
title("$$\dot{\theta}$$","Interpreter","latex")
xlim([0 T_max])

subplot(3,2,5)
plot(t,y(:,4)+y(:,3))
grid minor
xlabel("Time (s)"); ylabel("$$y(t)$$","Interpreter","latex")
title("$$y$$","Interpreter","latex")
xlim([0 5])
rho_y     = @(t) (0.6 - 0.01)*exp(-5*t) + 0.01;
hold on
plot(t,rho_y(t),'--r',t,-rho_y(t),'--r')

subplot(3,2,6)
plot(t,y(:,3))
grid minor
xlabel("Time (s)"); ylabel("$$e_\theta(t)$$","Interpreter","latex")
title("$$e_\theta$$","Interpreter","latex")
xlim([0 5])
rho_theta = @(t) (0.2 - 0.01)*exp(-5*t) + 0.01;
hold on
plot(t,rho_theta(t),'--r',t,-rho_theta(t),'--r')