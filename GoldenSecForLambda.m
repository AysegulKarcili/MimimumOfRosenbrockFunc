function [lambda] = GoldenSecForLambda(x1, x2, s1, s2)
% Use golden section method and find the value of lambda which results the 
% lambda function to take minimum value. Lambda function: A function of
% lambda which calculates the value of the main function (Rosenbrock
% function) at the point of (x1, x2) which has the unit negative partial
% derivatives s1 and s2 at that point. 
% y = 100*(x2-x1^2)^2+(1-x1)^2; % Rosenbrock function

lambdaStart = 0.001;
a = lambdaStart;
b = lambdaStart + 1 ;

ax1 = x1 + a*s1;
ax2 = x2 + a*s2;
ay = Rosenbrock(ax1, ax2);

bx1 = x1 + b*s1;
bx2 = x2 + b*s2;
by = Rosenbrock(bx1, bx2);

tol = 0.01;
R = 1-(0.5*(sqrt(5)-1));

cnt1 = 0;
cnt2 = 0;
while abs(by-ay) > tol
    if by > ay
        b = b - R*(b-a);
        bx1 = x1 + b*s1;
        bx2 = x2 + b*s2;
        by = Rosenbrock(bx1, bx2);
        cnt1 = cnt1+1;
    elseif ay > by
        a = a + R*(b-a);
        ax1 = x1 + a*s1;
        ax2 = x2 + a*s2;
        ay = Rosenbrock(ax1, ax2);
        cnt2 = cnt2+1;
    end    
end

if(cnt1 ~= 12 && cnt1 ~=13)
    fprintf('cnt1: %d, cnt2: %d\n', cnt1, cnt2);
end

lambda = a;
end 

% --- ignore ---
% 6*10^-3 --> 795 ; 5*10^-3 --> 612 ; 4*10^-3 --> 321 ; 3*10^-3 --> 4573 (distance=1) 
% 3*10^-3 --> 164 (distance=0.5) ; 6*10^-3 --> 795 ;
% --- ignore ---
% bx1 = bx1 - R*abs(bx1-ax1); % bx1-ax1 = (b-a)*s1
% bx2 = bx2 - R*abs(bx1-ax1);
% ax1 = ax1 + R*abs(bx1-ax1); 
% ax2 = ax2 + R*abs(bx1-ax1);
% --- ignore ---
