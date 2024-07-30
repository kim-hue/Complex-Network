% created by Anokina Shalimoon
% consensusMain_dir.m calls Cx_dir.m and Cy_dir.m functions to solve the consensus
% problem xdot = -Lx for both x and y direction for undirected graph of % multiagent system and it will run simulation which shows the agents in % every step achieving consensus eventually user inputs number of agents % they wish to observe
clear; close all;
prompt = 'Enter the number of agents: ';
n = input(prompt); %enter number of desired agents
x = rand(n,1);  %random x values for agents
y = rand(n,1);  %random y values for agents
t0 = 0;     %initial time
tf = 100;   %final time
alphax = mean(x); %consensus value in x direction alphay = mean(y); %consensus value in y direction
%Plot initial positions:
f1 = figure('Name','Initial Positions'); plot(x,y,'bo')
title('Initial Positions')
xlabel('x')
ylabel('y')
axis([0 1 0 1]);
hold on;
%% xdot Calculations
%[t,x]=ode45(@Cx,[t0,tf],x',[],n); %for undirected graph 
[t,x]=ode45(@Cx_dir,[t0,tf],x',[],n); %for directed cycle 
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
%[t,y]=ode45(@Cy,[t0,tf],y',[],n); %uncomment for Undirected graph 
[t,y]=ode45(@Cy_dir,[t0,tf],y',[],n); %uncomment for Directed cycle 
f3 = figure('Name','Consensus algorithm in y direction');
for i = 1:n
   plot(t,y(:,i))
hold on 
end
title('Consensus algorithm in y direction') 
xlabel({'t','(in seconds)'})
ylabel('y')
hold off
[xdim_x, xdim_y] = size(x);
[ydim_x, ydim_y] = size(y);
%Creating subplots
f4 = figure;
subplot(421);
for j = 1:n
plot(x(1,j),y(1,j),'ro','LineWidth',0.5,'MarkerFaceColor','w','MarkerSize', 6);
    hold on
    axis([0 1 0 1]); %for 2D
    grid on
end
title('Subplot 1: Initial Position');
hold on
subplot(422);
for j = 1:n
plot(x(20,j),y(20,j),'ro','LineWidth',0.5,'MarkerFaceColor','w','MarkerSize', 6);
    hold on
    axis([0 1 0 1]); %for 2D
    grid on
end
title('Subplot 2: Step 20');
hold on
subplot(423);
for j = 1:n
plot(x(40,j),y(40,j),'ro','LineWidth',0.5,'MarkerFaceColor','w','MarkerSize', 6);
    hold on
    axis([0 1 0 1]); %for 2D
    grid on
end
title('Subplot 3: Step 40');
hold on
subplot(424);
for j = 1:n
plot(x(60,j),y(60,j),'ro','LineWidth',0.5,'MarkerFaceColor','w','MarkerSize', 6);
    hold on
    axis([0 1 0 1]); %for 2D
    grid on
end
hold on
title('Subplot 4: Step 60');
subplot(425);
for j = 1:n
plot(x(80,j),y(80,j),'ro','LineWidth',0.5,'MarkerFaceColor','w','MarkerSize', 6);
    hold on
    axis([0 1 0 1]); %for 2D
    grid on
end
hold on
title('Subplot 5: Step 80');
subplot(426);
for j = 1:n
plot(x(100,j),y(100,j),'ro','LineWidth',0.5,'MarkerFaceColor','w','MarkerSize ', 6);
    hold on
    axis([0 1 0 1]); %for 2D
    grid on
end
hold on
title('Subplot 6: Step 100');
subplot(427);
for j = 1:n
plot(x(120,j),y(120,j),'ro','LineWidth',0.5,'MarkerFaceColor','w','MarkerSize ', 6);
    hold on
    axis([0 1 0 1]); %for 2D
    grid on
end
hold on
title('Subplot 7: Step 120');
subplot(428);
for j = 1:n
plot(x(xdim_x,j),y(ydim_x,j),'ro','LineWidth',0.5,'MarkerFaceColor','w','Mark erSize', 6);
    hold on
    axis([0 1 0 1]); %for 2D
    grid on
end
title('Subplot 8: Last Step');
%% plot 2D consensus graph movie
stepNum = 250;  %for directed cycle
f10 = figure;
for k = 1:stepNum
for j = 1:n 
    plot(x(k,j),y(k,j),'ro','LineWidth',0.5,'MarkerFaceColor','w','MarkerSize',6);
         axis([0 1 0 1]); %for 2D
        hold on; grid on;
end
    titlestring = ['Step ', num2str(k)];
    title(titlestring);
    hold off;
    M(k) = getframe;
end
