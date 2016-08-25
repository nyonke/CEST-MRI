function [ output_args ] = myfunc_strout( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if nargin<1
    x=randn(100,1);
    
end
output_args=zeros(size(x));
for q=1:length(x)
  output_args(q)=x(q).^2;
end

disp(output_args)
end