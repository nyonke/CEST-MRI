function [out]=call_external_function()
x=1:10;
out=myfunc_strout(x);
disp(out)
end