function [t ,x] = Cons_SmallW(N,K,beta)

s = repelem((1:N)',1,K);
t = s + repmat(1:K,N,1);
t = mod(t-1,N)+1;

% Rewire the target node of each edge with probability beta
for source=1:N    
    switchEdge = rand(K, 1) < beta;
    
    newTargets = rand(N, 1);
    newTargets(source) = 0;
    newTargets(s(t==source)) = 0;
    newTargets(t(source, ~switchEdge)) = 0;
    
    [~, ind] = sort(newTargets, 'descend');
    t(source, switchEdge) = ind(1:nnz(switchEdge));
end

h = graph(s,t);
L = laplacian(h);
t_initial = 0;
t_final = N;
x_ini = 1:N;
%x_ini = 1:10;
x_initial = x_ini';
[t,x] = ode45(@(t,x) CTC(t,x,L),[t_initial t_final],x_initial);

