clear; close all;
A_dir = [0 1 0 0; 0 0 1 0; 0 0 0 1;1 0 0 0]; %Adjacency matrix
D_dir = diag(sum(A_dir,1));% Degree Matrix
I = eye(4);
Lg = D_dir - A_dir; %Graph Laplacian 
Ln = (I+D_dir)^-1*Lg; %Normalized Laplacian 
P = (I+D_dir)^-1 *(I+A_dir); %Perron Matrix
N = 30;  %number of iteration to run the for loop 
tspan = 0:N-1; %time - span used for plotting x vs. t
x = zeros(4,N); %postion matrix 
x_init = [1 2 3 4]'; %initial positions 
x(:,1) = P*x_init; % x(1) = Fx(0)
%for loop to solve th DT consensus problem 
for i = 1:N-1
   if i == 0
    x(:,i+1) = P*x_init;
else
    x(:,i+1) = P*x(:,i);
   end 
end
evalue = round(eig(P),2);
figure(1)
plot(digraph(A_dir))
title('Directed Graph Representation') 
figure(2)
plot(tspan,x)
legend('Node 1','Node 2','Node 3','Node 4')
title('Discrete-time consensus for Directed Cycle Graph') 
xlabel({'t','(in seconds)'})
ylabel('x')
xlim([0 25]);
ylim([1 4]);
figure(3)
plot(evalue,'r*','LineWidth',1)
title('Eigenvalues of the Perron Matrix For Directed Cycle Graph') 
xlabel('real')
ylabel('imag')
axis equal;
grid on