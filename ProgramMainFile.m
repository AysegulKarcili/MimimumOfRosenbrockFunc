clear; 
% THIS PROGRAM STARTS FROM THIS FILE. 
% THIS FILE CALLS RosenAndDerivsAndLambda(). 
% RosenAndDerivsAndLambda() CALLS GoldenSecForLambda(). 
% GoldenSecForLambda() CALLS Rosenbrock(). 

% Find minimum of the Rosenbrock function using steepest descent method and
% optimize the lambda (learning rate) of steepest descent using golden
% section method. 

x1 = 2; % Start with the initial guess (2,2).
x2 = 2;

[y, s1, s2, lambda] = RosenAndDerivsAndLambda(x1,x2);
fprintf('lambda: %.10f\n', lambda);

difference = 1;
tolerance = 0.000001;
counter = 0;

while difference > tolerance 
    y_old = y;
    x1 = x1 + lambda*s1;
    x2 = x2 + lambda*s2;
    [y, s1, s2, lambda] = RosenAndDerivsAndLambda(x1,x2);
    if (lambda ~= 0.001)
        fprintf('lambda: %.10f, step:%d\n', lambda, counter+1);
    end
    difference = abs(y-y_old); 
    counter = counter + 1;
end 