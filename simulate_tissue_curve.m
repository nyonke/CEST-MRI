function [Ctoi]=simulate_tissue_curve()
% Simluate the concentrations in a tissue as function of time 
% with internal functions

time=0:5/60:15; time=time';
Cp=Cp10(time);
Ctoi=myToftsCt2(.25,.4,time,Cp)';
disp(Ctoi)

function [c_toi] = myToftsCt2(ktrans,kep,t,Cp)

% [c_toi] =myToftsCt2(ktrans,kep,t,Cp)
% ktrans=pars(1);
% kep=pars(2);
% t=X(:,1);
% Cp=X(:,2);


n_points=length(t);
% expo=zeros(1,n_points);
% crpexp=expo;
% c_toi=crpexp;

for k = 2:n_points
    int_t = t(k);
    
    for j = 1:k
        dummy_t = t(j);
        expo(j) =exp(-((kep.*(int_t-dummy_t))));
        crpexp(j) = Cp(j)*expo(j);
    end
    t2 = t(1:k);
    %%
    crpexp_integral = trapz(t2,crpexp);
    %     crpexp_integral = trapzfm(t2,crpexp); % quicker?
    c_toi(k) = ktrans*crpexp_integral;
end
end

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
end