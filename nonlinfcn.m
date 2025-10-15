function dydt = nonlinfcn(t,y,u)

g = 9.8;
m = 0.5;
M = 2;
l = 0.5;
I = m * l ^ 2 / 3;

D = 4*M+m*(1+3*sin(y(3))^2);

dydt = zeros(4,1);

dydt(1) = y(2);
dydt(2) = (4*u + 4*m*l*y(4)^2*sin(y(3))-3*g*m*sin(y(3))*cos(y(3))) / D;
dydt(3) = y(4);
dydt(4) = 3*((M+m)*g*sin(y(3))-m*l*y(4)^2*sin(y(3))*cos(y(3))-u*cos(y(3))) / D;

end