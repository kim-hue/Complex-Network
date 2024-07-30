%[t1 ,x1] = Cons_SmallW(1000,3,0.3);

%[t2 ,x2] = Cons_SmallW(1000,3,0.5);

[t3 ,x3] = Cons_SmallW(200,9,0.5);
%figure(1)
%plot(t1,x1)
%title('Discrete-time consensus for Directed Graph') 
%xlabel({'t1','(in seconds)'})
%ylabel('x1')
%%%%%%
%figure(2)
%plot(t2,x2)
%title('Discrete-time consensus for Directed Graph') 
%xlabel({'t2','(in seconds)'})
%ylabel('x2')
%%%%%%
figure(3)
plot(t3,x3)
%title('Consensus Computation for Small - based Public BlockChain') 
xlabel({'Consensus time (in seconds)'})
ylabel('Number of Nodes')