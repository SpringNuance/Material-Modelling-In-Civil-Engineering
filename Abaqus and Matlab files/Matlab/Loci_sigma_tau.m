%clc;
clear all;
set(0,'DefaultAxesFontSize',30,'DefaultAxesFontName','Arial');
%
Sc = 4;
St = 1;
m = Sc/St;
A = (3*m^2 + (3-2*sqrt(3))*m)/(m+1);
B = (3*m^2 - sqrt(3)*m-3+sqrt(3))/3/(m+1);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(figure(1), 'Position', [500 150 900 600])
vM = @(x,y) x.^2 + 3*y.^2 - 1;
vM = fimplicit(vM,[-1 1 0 0.6],'k','LineWidth',3);
hold on
Tr = @(x,y) x.^2 + 4*y.^2 - 1;
Tr = fimplicit(Tr,[-1 1 0 0.6],'b','LineWidth',3);
hold on
DP = @(x,y) (m+1)/2*(x.^2 + 3*y.^2).^0.5 + (m-1)/2*x - 1;
DP = fimplicit(DP,[-1 1 0 0.6],'--k','LineWidth',3);
hold on
MC = @(x,y) (m+1)/2*(x.^2 + 4*y.^2).^0.5 + (m-1)/2*x - 1;
MC = fimplicit(MC,[-1 1 0 0.6],'--b','LineWidth',3);
hold on
Ot = @(x,y) A/3*(x.^2 + 3*y.^2) + 1/sqrt(3)*(x.^2 + 3*y.^2).^0.5 + B*x - 1;
Ot = fimplicit(Ot,[-1 1 0 0.6],'r','LineWidth',3);
hold off
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%title(['title'])
xlabel('$\sigma/\sigma_c$','interpreter','latex')
ylabel('$\tau/\sigma_c$','interpreter','latex')
%
legend([vM Tr DP MC Ot], ...
            'vM',...
            'Tr',...
            'DP',...
            'MC',...
            'Ot',...
            'Location','northeastoutside',...
            'interpreter','latex')
h = legend('show');
h.FontSize = 25;
%h.NumColumns=2;
ax = gca;
%ax.XLim = [0 150];
%
%Filename = ['C:\SIMULIA\temp\CIV-E4080\Figures\' ... 
%            'Locus_sigma_tau'];
%Filename = strrep(Filename, '.', '');
%print(Filename, '-dpng')
%