%This function is called by consensusMain_undir.m to solve consensus problem %in the y direction
function ydot = Cy(t,y,n)
A = ones(n) - eye(n); %undirected graph laplacian Kn
ydot = zeros(n,1);
for i=1:n
    for j = 1:n
    ydot(i) = A(i,j)*(y(j)-y(i))+ ydot(i);
    end 
end
end