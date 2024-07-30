%Created by Anokina Shalimoon
%DTC_undir.m
%This function solves discrete time consensus problem for 4 node %undirected graph that follows a cycle
clear;close all
A_undir = [0 1 0 1; 1 0 1 0; 0 1 0 1;1 0 1 0]; %Adjacency matrix 
D_undir = 2*eye(4); %Degree Matrix
I = eye(4);
P = (I+D_undir)^-1 *(I+A_undir);%Perron Matrix
N = 10;%number of iteration to run the for loop
tspan = 0:N-1; %time-span used for plotting x vs. t
x = zeros(4,N);%position matrix
x_init = [1 2 3 4]';%initial positions
x(:,1) = P*x_init; %x(1) = Fx(0)
% for loop to solve the DT consensus problem
for i = 1:N-1
   if i == 0
    x(:,i+1) = P*x_init;
else
    x(:,i+1) = P*x(:,i);
   end 
end
evalue = round(eig(P),2);%Eigenvalues of the Perron Matrix
figure(1)
plot(graph(A_undir))
title('Undirected Graph Representation')
figure(2)
plot(tspan,x)
legend('Node 1','Node 2','Node 3','Node 4') 
title('Discrete-time consensus for Undirected Graph') 
xlabel({'t','(in seconds)'})
ylabel('x')
figure(3)
plot(evalue,'r*','LineWidth',1)
title('Eigenvalues of the Perron Matrix For Undirected Graph') 
xlabel('real')
ylabel('imag')
axis equal;
grid on
