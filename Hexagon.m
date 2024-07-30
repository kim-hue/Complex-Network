%created by Anokina Shalimoon
%Hexagon formation for Directed cycle vs. undirected K6
%This function will call formODE for solving ode45 purposes
%f1 can be kept constant and f2 modified to observe the difference in the %result by changing feedback parameters
%this function calls formODE.m to solve ode45
clear;clc;close all
N = 6;
a21 = 0;
a22 = 0;
n = 2;
f1= -10;
f2= -20;
A1 = [0 1;a21 a22];
Aveh = blkdiag(A1,A1);
Bveh = kron(eye(n),[0;1]);
Fveh = kron(eye(n),[f1 f2]);
%%%%%%%%%%%%%%%%%%%%%%%%%
P = rand(2*N,1);
V = rand(2*N,1);
% P = [1 1,1 2,1 3,1 4,1 5]';
% V = [1 1,1 1,1 1,1 1,0 0]';
%%%%%%%%%%%%%%%%%%%%%%%%%
X = kron(P,[1;0])+kron(V,[0;1]);
A = kron(eye(N),Aveh);
B = kron(eye(N),Bveh);
F = kron(eye(N),Fveh); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%For this section the user can uncomment which ever graph they want to 
%study, Undirected K4 or Directed Cycle and observe the differences.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%-----------------------------Undirected-K5-------------------------------% % 
% D = (N-1)*eye(N);
% Q = ones(N)-eye(N);
%-----------------------------Directed cycle------------------------------% 
D = eye(N);
Q = [0 1 0 0 0 0;0 0 1 0 0 0;0 0 0 1 0 0;0 0 0 0 1 0;0 0 0 0 0 1;1 0 0 0 0 0]; 
%-------------------------------------------------------------------------% 
% figure(1)
% G = digraph(Q); %used to plot directed graph
%Agent Number
%dimention 2D
%feedback gain parameters
%feedback gain parameters
%Aveh Matrix
%Aveh = diag(Av(1), ... ,Av(n)) for 2D n= 2
%Bveh Vector
%Feedback Control Law (f1,f2)
% %G = graph(Q);
% plot(G)
% title('Directed Cycle') 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
Lg = D - Q; %Graph laplacian matrix
L = kron(Lg,eye(2*n));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%For Square%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %hexagon formation model
hp = [0 0,4 0,6 2*sqrt(3),4 4*sqrt(3),0 4*sqrt(3),-2 2*sqrt(3)]';
hv = [0 0,0 0,0 0,0 0,0 0,0 0]'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
h = kron(hp,[1;0])+kron(hv,[0;1]); %formation matrix
%solve ode45 for xdot = Ax + Bu
t0 = 0;
tf = 80;
tspan = [t0 tf];
Xinit = X;
C1 = A;
C2 = B*F*L;
[t, y]=ode45(@(t,y) formODE(t,y,h,C1,C2),tspan,Xinit);
%position and velocity matrices
[d1,d2] = size(y);
pos = zeros(d1,2*N);
vel = zeros(d1,2*N);
for i = 1:2*N
    pos(:,i) = y(:,2*i-1);  %Position
    vel(:,i) = y(:,2*i);    %Velocity
end
%calculating error between position and the desired formation
for i = 1:d1
    e(i,:) = pos(i,:)- hp';
end
%control input matrix
utemp = ((F*L)'*e')';
for i = 1:2*N
   u(:,i) = utemp(:,2*i);
end
%for graphing purposes
x1 = pos(:,1);
y1 = pos(:,2);
x2 = pos(:,3);
y2 = pos(:,4);
x3 = pos(:,5);
y3 = pos(:,6);
x4 = pos(:,7);
y4 = pos(:,8);
x5 = pos(:,9);
y5 = pos(:,10);
x6 = pos(:,11);
y6 = pos(:,12);
% Plot results
figure(2);
h1 = plot(x1(1),y1(1),'x',x2(1),y2(1),'x',x3(1),y3(1),'x',x4(1),y4(1),'x',x5(1),y5 (1),'x',x6(1),y6(1),'x');
hold on
h2 = plot(x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6);
hold on
h3 = plot(x1(end),y1(end),'ko',x2(end),y2(end),'mo',x3(end),y3(end),'bo',x4(end),y4(end),'go',x5(end),y5(end),'ro',x6(end),y6(end),'co');
xf = [x1(end) x2(end) x3(end) x4(end) x5(end) x6(end) x1(end)];
yf = [y1(end) y2(end) y3(end) y4(end) y5(end) y6(end) y1(end)];
plot(xf, yf, 'b-', 'LineWidth', 1);
xlabel('x')
ylabel('y')
title('Directed Cycle') 
legend(h3,'agent_1','agent_2','agent_3','agent_4','agent_5','agent_6','locati on','best')
hold off; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figure(3)
plot(t,u);
xlabel('t (sec)')
ylabel('control input, u(t)') 
legend('u1_x','u1_y','u2_x','u2_y','u3_x','u3_y','u4_x','u4_y','u5_x','u5_y', 'u6_x','u6_y','location','best')
title('Control input vs. time')


