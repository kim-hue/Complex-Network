%This function is called by consensusMain_undir.m to solve consensus problem %in the x direction
function xdot = Cx(t,x,n)
A = ones(n) - eye(n); %undirected graph laplacian Kn
xdot = zeros(n,1);
for i=1:n
    for j = 1:n
    xdot(i) = A(i,j)*(x(j)-x(i))+ xdot(i);
    end 
end
end