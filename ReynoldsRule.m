%This function shows an animation of flocking where Reynolds rules are %applied user can manipulate agentNum, K,S, and M parameters so see the %difference between each case. This is a stable case that is provided below clear; close all;
agentNum = 200; %number of agents
x0 = 15; %initial position spread
u0 = 5; %initial velocity spread
x = x0*randn(2,agentNum); %position vector x = [p;q];
u = u0*randn(2,agentNum); %velocity vector u = [up;uq]; %constants
a = 0.2; %flock centering gain
c = 0.2; %collision avoidance gain
%These constants changes the contribution of each force 
K = 0.1;
S = 5;
M = 1.1;
%Initialization
v = 10; %controls how fast agents accelerate after they come together 
L = 20; %plot axis limit
stepNum = 120; %number of iteration to run animation 
dt = 0.01; %time to draw bins
result = zeros(stepNum,agentNum);
for n=1:stepNum
s = zeros(2,agentNum); %Seperation Vector/collision avoidance 
k = zeros(2,agentNum); %Cohesion Vector/flock centering
ux = sum(u(1,:))/agentNum; %average velocity in x-direction 
uy = sum(u(2,:))/agentNum; %average velocity in y-direction
m = [ux;uy]; %average velocity for alignment vector
norm_m = norm(m); %Euclidean norm of the velocity vector
    if(norm_m > v) %this if statement controls the acceleration of agents after they come together
        m = v*m/norm_m;
    end
    for i = 1:agentNum
        for j = 1:agentNum
            if i~= j %we ignore when j = i
                r = x(:,j)-x(:,i); %actual
                d = sqrt(r(1)^2+(r(2)^2));
                s(:,i) = s(:,i) - c*r/d^2;
                k(:,i) = k(:,i) + a*r;
            end 
        end
    u(:,i) = K*k(:,i)+ S*s(:,i)+ M*m; %total velocity
    x(:,i) = x(:,i) + u(:,i)*dt; %position velocity formula x = x+vt 
    end
    result(2*n-1,:) = x(1,:);
    result(2*n,:) = x(2,:); plot(x(1,:),x(2,:),'r.','LineWidth',5,'Markersize',7); hold on; axis([-L L -L L]);
    xlabel('x') % x-axis label
    ylabel('y') % y-axis label
    titlestr = ['Step ', num2str(n)];
    title(titlestr);
    F(:,n) = getframe;
    hold off;
end
f2 = figure;
subplot(231); plot(result(1,:),x(2,:),'r.','LineWidth',5,'Markersize',7); 
title('Initial Positions');axis([-L L -L L]);
xlabel('X');
ylabel('Y');
hold on;
subplot(232); plot(result(9,:),result(10,:),'r.','LineWidth',5,'Markersize',7) 
title('Step 10');axis([-L L -L L]);
xlabel('X');
ylabel('Y');
hold on;
subplot(233); plot(result(19,:),result(20,:),'r.','LineWidth',5,'Markersize',7) 
title('Step 20');axis([-L L -L L]);
xlabel('X');
ylabel('Y');
hold on;
subplot(2,3,4);
plot(result(39,:),result(40,:),'r.','LineWidth',5,'Markersize',7) 
title('Step 40');axis([-L L -L L]);
xlabel('X');
ylabel('Y');
hold on;
subplot(235); plot(result(69,:),result(70,:),'r.','LineWidth',5,'Markersize',7) 
title('Step 70');axis([-L L -L L]);
xlabel('X');
ylabel('Y');
hold on;
subplot(236); plot(result(119,:),result(120,:),'r.','LineWidth',5,'Markersize',7) 
title('Step 120');axis([-L L -L L]);
xlabel('X');
ylabel('Y');
hold off;