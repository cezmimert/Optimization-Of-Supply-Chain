function [z sol2]=mycost(sol1,model)

sol2=parsesolution(sol1,model);
z=sol2.FinalCost;

end