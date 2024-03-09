function y=mutate(x,vars) 

y.xhat=eskimutate(x.xhat,vars.xhat.min,vars.xhat.max); 
y.yhat=eskimutate(x.yhat,vars.yhat.min,vars.yhat.max);

end

function y=eskimutate(x,varmax,varmin) 
    
n=numel(x);
mu=0.5;
y=ceil(n*mu);
j=randsample(n,y);
sigma=0.1*(varmax-varmin);

y=x;
y(j)=x(j)+(sigma*randn(size(1,j)))';

y=max(y,varmin);
y=min(y,varmax);

end