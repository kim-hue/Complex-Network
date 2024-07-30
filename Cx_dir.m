% Cx_dir.m this function is called by consensusMain_dir to solve consensus problem in
% x direction and it uses a cycle graph laplacian created with circshift
% matlab function
function xdot = Cx_dir(t,x,n)
A_array = zeros(1,n); %create an array of [0 0 0 ...0]
rw = 1;
cm = 2;
index = sub2ind(size(A_array), rw, cm);
A_array(index) = 1; %this will generate an array of [0 1 0 ... 0]
A_dir = zeros(n); %Adjacency matrix for directed graph initialization
for k = 1:n
    if k == 1
        A_dir(1,:) = A_array;
else
A_dir(k,:) = circshift(A_dir(k-1,:),1); %circular shift to create adjacency matrix for directed cycle
    end 
end
xdot = zeros(n,1);
    for i=1:n
        for j = 1:n
            xdot(i)= A_dir(i,j)*(x(j)-x(i))+ xdot(i);
        end 
    end
end

