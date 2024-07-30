% Created by Anokina Shalimoon
% consensusMain_undir.m calls Cx.m and Cy.m functions to solve the consensus % problem xdot = -Lx for both x and y direction for undirected graph of many % agents, and runs an animation which shows the agents in every step achieving
% consensus eventually this code prompts the user to enter the number of
% agents they wish to observe
prompt = 'Enter the number of agents: ';
n = input(prompt); %enter number of desired agents
A = ones(n) - eye(n); %adjacency matrix considering undirected case- continuous time consensus
x = rand(n,1);  %random x values for agents
y = rand(n,1);  %random y values for agents
t0 = 0;     %initial time
tf = 0.5;   %final time
alphax = mean(x); %consensus value in x direction alphay = mean(y); %consensus value in y direction
%Plot initial positions:
f1 = figure('Name','Initial Positions'); plot(x,y,'bo')
title('Initial Positions')
xlabel('x')
ylabel('y')
axis([0 1 0 1]);
hold on;
%% xdot Calculations
[t,x]=ode45(@Cx,[t0,tf],x',[],n);
f2 = figure('Name','Consensus algorithm in x direction'); 
for i = 1:n
   plot(t,x(:,i))
hold on 
end
title('Consensus algorithm in x direction') 
xlabel({'t','(in seconds)'})
ylabel('x')
hold off
%% ydot Calculations
[t,y]=ode45(@Cy,[t0,tf],y',[],n);
f3 = figure('Name','Consensus algorithm in y direction'); 
for j = 1:n
   plot(t,y(:,j))
hold on 
end
title('Consensus algorithm in y direction') 
xlabel({'t','(in seconds)'})
ylabel('y')
hold off
%%
%Creating subplots
f4 = figure;
subplot(3,2,1);
for j = 1:n
plot(x(1,j),y(1,j),'r.','LineWidth',1,'MarkerFaceColor','y','MarkerSize', 6);
hold on
    axis([0 1 0 1]); %for 2D
end
title('Subplot 1: Iteration = 1');
hold on
subplot(3,2,2);
for j = 1:n
plot(x(10,j),y(10,j),'r.','LineWidth',1,'MarkerFaceColor','y','MarkerSize', 6);
hold on
    axis([0 1 0 1]); %for 2D
end
title('Subplot 2: Iteration = 10');
hold on
subplot(3,2,3);
for j = 1:n
plot(x(15,j),y(15,j),'r.','LineWidth',1,'MarkerFaceColor','y','MarkerSize', 6);
hold on
    axis([0 1 0 1]); %for 2D
end
title('Subplot 3: Iteration = 15');
hold on
subplot(3,2,4);
for j = 1:n
plot(x(20,j),y(20,j),'r.','LineWidth',1,'MarkerFaceColor','y','MarkerSize', 6);
hold on
    axis([0 1 0 1]); %for 2D
end
hold on
title('Subplot 4: Iteration = 20');
subplot(3,2,5);
for j = 1:n
plot(x(30,j),y(30,j),'r.','LineWidth',1,'MarkerFaceColor','y','MarkerSize', 6);
hold on
    axis([0 1 0 1]); %for 2D
end
hold on
title('Subplot 5: Iteration = 30');
subplot(3,2,6);
for j = 1:n
plot(x(40,j),y(40,j),'r.','LineWidth',1,'MarkerFaceColor','y','MarkerSize', 6);
hold on
    axis([0 1 0 1]); %for 2D
end
title('Subplot 6: Iteration = 40');
%% plot 2D consensus graph movie
stepNum = 40;
f5 = figure;
for k = 1:stepNum
    for j = 1:n
    plot(x(k,j),y(k,j),'r.','LineWidth',2,'MarkerFaceColor','y','MarkerSize', 7); axis([0 1 0 1]); %for 2D
        hold on; grid on;
    end
    titlestr = ['Step ', num2str(k)];
    title(titlestr);
    hold off;
    M(k) = getframe;
end