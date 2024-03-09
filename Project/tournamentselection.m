function i=tournamentselection(pop)
%hem rastsal davranıyor hem iyi olanı seçiyor  
n=numel(pop);
s=randsample(n,10);
spop=pop(s);
scost=[spop.maliyet];
[cost y]=min(scost);
i=s(y);

end