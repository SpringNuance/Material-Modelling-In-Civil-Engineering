%clc;
clear all;
set(0,'DefaultAxesFontSize',30,'DefaultAxesFontName','Arial');
%
Sc = 1.2;
St = 1;
m = Sc/St;
A = (3*m^2 + (3-2*sqrt(3))*m)/(m+1);
B = (3*m^2 - sqrt(3)*m-3+sqrt(3))/3/(m+1);
%
Xa = -10;
Xb =  5;
Ya =  0;
Yb =  4;
%
SmM = -5*Sc;
SmF = -10*Sc;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(figure(1), 'Position', [500 150 900 600])
vM = @(x,y) y - 1;
vM = fimplicit(vM,[Xa Xb Ya Yb],'k','LineWidth',3);
hold on
Tr = @(x,y) y - sqrt(3)/2;
Tr = fimplicit(Tr,[Xa Xb Ya Yb],'b','LineWidth',3);
hold on
DP = @(x,y) (m+1)/2*y + (m-1)/2*3*x - 1;
DP = fimplicit(DP,[Xa Xb Ya Yb],'--k','LineWidth',3);
hold on
MC = @(x,y) (m+1)/sqrt(3)*y + (m-1)/2*3*x - 1;
MC = fimplicit(MC,[Xa Xb Ya Yb],'--b','LineWidth',3);
hold on
Ot = @(x,y) A/3*y.^2 + 1/sqrt(3)*y + 3*B*x - 1;
Ot = fimplicit(Ot,[Xa Xb Ya Yb],'r','LineWidth',3);
hold on
OtC = @(x,y) A/3*y.^2 + 1/sqrt(3)*y + (1-((x-SmM/Sc)/(SmF/Sc-SmM/Sc)).^2)*(3*B.*x - 1);
OtC = fimplicit(OtC,[Xa SmM/Sc Ya Yb],'--r','LineWidth',3);
hold off
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%title(['title'])
xlabel('$\sigma_m/\sigma_c$','interpreter','latex')
ylabel('$\sigma_e/\sigma_c$','interpreter','latex')
%
legend([vM Tr DP MC Ot OtC], ...
            'vM',...
            'Tr',...
            'DP',...
            'MC',...
            'Ot',...
            'OtC',...
            'Location','northeastoutside',...
            'interpreter','latex')
h = legend('show');
h.FontSize = 25;
%h.NumColumns=2;
ax = gca;
%ax.XLim = [0 150];
%
%Filename = ['C:\SIMULIA\temp\CIV-E4080\Figures\' ... 
%            'Locus_meridian_cap'];
%Filename = strrep(Filename, '.', '');
%print(Filename, '-dpng')
%