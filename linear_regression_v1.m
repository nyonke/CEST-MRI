function [coefficients]=linear_regression_v1()
% Linear Regression WITHOUT random number generator or matlab commands for
% regression.

X=zeros(100,2);
beta=[-10;10];
for q=1:100
   X(q,1)=q;
   X(q,2)=q.^2;
end
y=X*beta;
coefficients=inv(X'*X)*X'*y;
disp(coefficients)
end