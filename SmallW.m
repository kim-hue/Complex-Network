h1 = WattsStrogatz(10,4,0);
h2 = WattsStrogatz(10,4,0.2);
h3 = WattsStrogatz(10,4,1);
%subplot(2,2,1);
figure;
plot(h1,'NodeColor','k','Layout','circle');
%subplot(2,2,2); 

figure;
plot(h2,'NodeColor','k','Layout','circle');
%subplot(2,2,3); 

figure;
plot(h3,'NodeColor','k','Layout','circle');
%title('Watts-Strogatz Graph with $N = 500$ nodes, $K = 25$, and $\beta = 0$','Interpreter','latex')
%saveas(gcf,'smallworld.eps');
