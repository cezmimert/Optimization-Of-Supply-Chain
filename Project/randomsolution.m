function sol1=randomsolution(model)

I=model.I;
J=model.J;
K=model.K;

xhat=rand(J,I);
yhat=rand(K,J);

sol1.xhat=xhat;
sol1.yhat=yhat;


end