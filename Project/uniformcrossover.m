function [kiz erkek]=uniformcrossover(anne,baba,vars)

[kiz.xhat erkek.xhat]=eskiuniformcrossover(anne.xhat,baba.xhat,vars.xhat.min,vars.xhat.max);
[kiz.yhat erkek.yhat]=eskiuniformcrossover(anne.yhat,baba.yhat,vars.yhat.min,vars.yhat.max);



end


function [kiz erkek]=eskiuniformcrossover(anne,baba,varmin,varmax)



alpha=unifrnd(0,1,size(anne));
kiz=alpha.*anne+(1-alpha).*baba;
erkek=alpha.*baba+(1-alpha).*anne;

kiz=max(kiz,varmin);
kiz=min(kiz,varmax);


erkek=max(erkek,varmin);
erkek=min(erkek,varmax);
end