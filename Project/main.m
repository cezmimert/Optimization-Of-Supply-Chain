clear;
clc;
close all;

%% definition problem

model=createmodel();
costfunction=@(sol1)(mycost(sol1,model));

vars.xhat.min=0;
vars.xhat.max=1;
vars.xhat.size=[model.J model.I];
vars.xhat.count=prod(vars.xhat.size);

vars.yhat.min=0;
vars.yhat.max=1;
vars.yhat.size=[model.K model.J];
vars.yhat.count=prod(vars.yhat.size);


%% initilaziton
Npop=20;

birey.pozisyon=[];
birey.maliyet=[];
birey.sol=[];
pop=repmat(birey,Npop,1);


for i=1:Npop
    pop(i).pozisyon=randomsolution(model);
    [pop(i).maliyet pop(i).sol ]=costfunction(pop(i).pozisyon);
end
% 
cost=[pop.maliyet];
[cost,y]=sort(cost);
pop=pop(y);
best.sol=pop(1); 


%%main Loop
iterasyon=10;
pc=0.7;
Npopc=round(pc*Npop/2);
pm=0.5;
Npopm=round(pm*Npop);
for it=1:iterasyon

    %crossover
    popc=repmat(birey,Npop/2,2);
    for k=1:Npop/2
        %selection
        i1=tournamentselection(pop);
        pop1=pop(i1);
        
        i2=tournamentselection(pop);
        pop2=pop(i2);
        
        [popc(k,1).pozisyon,popc(k,2).pozisyon]=uniformcrossover(pop1.pozisyon,pop2.pozisyon,vars);
        [popc(k,1).maliyet popc(k,1).sol]=costfunction(popc(k,1).pozisyon);
        [popc(k,2 ).maliyet popc(k,2).sol]=costfunction(popc(k,2).pozisyon);
    end
    popc=popc(  :);

    %mutation
    popm=repmat(birey,Npop,1);
    for j=1:Npopm
        %selection
        i1=tournamentselection(pop); 
        pop1=pop(i1);
        popm(j).pozisyon=mutate(pop1.pozisyon,vars); 
        [popm(j).maliyet popm(j).sol]=costfunction(popm(j).pozisyon);
    
    end
    pop=[pop;popc];
    cost=[pop.maliyet];
    [cost,y]=sort(cost);
    pop=pop(y);     
    best.sol(it)=pop(1);
    
    pop=pop(1:Npop);
    bestsol=pop(1);
    bestcost(it)=best.sol(it).maliyet;
    
    if bestsol.sol.isFeasible
        Flag=' *';
    else
        Flag=' ';
    end
    
   disp(['Iteration' num2str(it) ', Best Cost =', num2str(bestcost(it)) Flag]);

end


figure;
plot(bestcost);
xlabel('Iteration');
ylabel('Best Solution');
