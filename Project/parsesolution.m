function sol2=parsesolution(sol1,model)

I=model.I;
J=model.J;
K=model.K;
R=model.R;
D=model.D;
P=model.P;
a=model.a;
b=model.b;

xhat=sol1.xhat;
yhat=sol1.yhat;
x=zeros(J,I);

for i=1:I
    for j=1:J
        x(j,i)=R(i)*xhat(j,i)/sum(xhat(:,i));        
    end
end

y=zeros(K,J);
for j=1:J
    for k=1:K
        y(k,j)=min(D(j),sum(x(:,j)))*yhat(k,j)/sum(yhat(:,j));        
    end
end

u=zeros(1,J);
for j=1:J
    u(j)=max(sum(x(j,:))/D(j)-1,0);
end
umean=mean(u);

v=zeros(1,K);
for k=1:K
    v(k)=max(sum(y(k,:))/P(k)-1,0);
end
vmean=mean(v);

violation=(umean+vmean)/2;

AX=a.*x;
sumAX=sum(AX(:));
BY=b.*y;
sumBY=sum(BY(:));

beta=10;
z=sumAX+sumBY; %toplam maliyet
z1=z*(1+beta*violation);


sol2.X=x;
sol2.Y=y;
sol2.u=u;
sol2.v=v;
sol2.umean=umean;
sol2.vmean=vmean;
sol2.violation=violation;
sol2.FinalCost=z1;
sol2.Cost=z;
sol2.isFeasible=(violation==0);


end