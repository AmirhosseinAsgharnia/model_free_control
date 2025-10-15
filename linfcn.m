function dydt = linfcn(t,y,u)

g = 9.8;
m = 0.5;
M = 2;
l = 0.5;
I = m * l ^ 2 / 3;

D = m*l^2*M+I*M+I*m;

dydt = zeros(4,1);

dydt(1) = y(2);
dydt(2) = (-y(3)*g*l^2*m^2 + l^2*m*u + I*u) / D;
dydt(3) = y(4);
dydt(4) = (m*l*(g*y(3)*M + g*y(3)*m - u)) / D;

end