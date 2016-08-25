function [Cp]=simulate_arterial_input()
% Simluate the AIF with internal functions
% regression.
time=0:5/60:15; time=time';

Cp=Cp10(time);

% ## Internal Function
function [Cp_out] = Cp10(t)
%Input:  time t in minutes
%THIS FUNCTION CALCULATES AN AIF WITH A SIMULATED INJECTION TIME OF 10
%SECONDS
%Injection of 10 seconds
A= 30.0 ; %mM/min
B= 1.0  ;
C= 4.0  ; %min^-1
D= 0.65 ; %mM
E= 5.0  ; %min
F= 0.04 ;  %min-1
Cp_out=A.*(t.^B).*exp(-t.*C)+ D.*(1-exp(-t.*E)).* exp(-t.*F);%inject = 10sec
end
disp(Cp)
end