function [y, s1, s2, lambda] = RosenAndDerivsAndLambda( x1, x2 )

y = 100*(x2-x1^2)^2+(1-x1)^2; % Rosenbrock function

dydx1 = -400*x1*(x2-x1^2)-2*(1-x1);
dydx2 = 200*(x2-x1^2);

s1 = -dydx1/sqrt(dydx1^2+dydx2^2);
s2 = -dydx2/sqrt(dydx1^2+dydx2^2);
   
lambda = GoldenSecForLambda(x1, x2, s1, s2);
end 