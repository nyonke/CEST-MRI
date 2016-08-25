function [coefficients]=linear_regression_v2()
% Linear Regression WITH random number generator or matlab commands for
% regression.
X=randn(100,2);
beta=[-10;10];
y=X*beta;
coefficients=pinv(X)*y;
disp(coefficients)
end