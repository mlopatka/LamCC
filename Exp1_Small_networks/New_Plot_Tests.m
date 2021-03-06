%% Here we reproduce the plots from the main text of the paper
% Load data run in the Run_experiments.m file
addpath('PlotData/')
load PlotDataForLP3football.mat
L = round(Lams,3);

% To emphasize the behavior of algorithms for very small lambda, we use a pseudo-logarithmic scale
% (first half of axis is logarithmic, second half is plotted linearly)
Lams = 1:numel(Lams);

%% Plot everything for starters
pivcol = [0 .75 0];
color = [1 .6 0];
figure(1); clf;
hax=axes; 
lw = 1;
design = '.-';
ms = 12;
plot(Lams,Piv,design,'LineWidth',lw,'markersize',ms,'color',pivcol);
hold on
plot(Lams,BG11,design,'LineWidth',lw,'markersize',ms,'color',color);
plot(Lams,LL,design,'LineWidth',lw,'markersize',ms,'color','k');
plot(Lams,GC,design,'LineWidth',lw,'markersize',ms,'color','r');
plot(Lams,LP3,design,'LineWidth',lw,'markersize',ms,'color','b');

% Text for stuff

h=text(7,1.5,'ICM');
fsize = 10;
set(h,'Rotation',0,'color',[1 .6 0],'fontsize',fsize);

h=text(20.25,2.25,'Pivot');
set(h,'Rotation',0,'color',pivcol,'fontsize',fsize);

h=text(20,1.75,'threeLP');
set(h,'Rotation',0,'color','b','fontsize',fsize);

h=text(11,1.25,'GrowClus');
set(h,'Rotation',0,'color','r','fontsize',fsize);

h=text(19.5,1.00,'Lam-Louv');
set(h,'Rotation',0,'color','k','fontsize',fsize);

set(gca,'YTick',[1 1.5 2 2.5])
set(gca,'YTickLabel',{'1' '1.5' '2' '2.5'});

%% Find out where the sparsest cut line goes

for j = 1:numel(L)
    if SC > L(j)
        here = j;
    end
end
topy = 2.95;
topy = 2.6;
place = (2*here+1)/2;
plot([place place],[0 topy],'LineWidth',lw,'color',[.9 .9 0])

h=text(place,.68,'\lambda*');
set(h,'Rotation',0,'color','k','fontsize',fsize);


box off
set(gca,'XTick',[4,6,10,14,18,22])

set(gca,'XTickLabel',{'.01','.05','.25','.5','.7','.9'});
xlim([2,numel(Lams)]);

% Uncomment this if you want linear axes
%xlim([0,1]);

ylim([.9,topy]);
% legend('Piv','ICM','Lam-Louv','GC','threeLP','\lambda^*')
% legend('Location','North');
% legend boxoff
xlabel('\lambda','fontsize',15);
ylabel({'Approx. Ratio'});
hold off
%% Save plot if desired
set_figure_size([2.25*1.5,1.75*1.5]);
print(gcf,sprintf(strcat('Figures/plot_',name,'.eps')),'-depsc2');
Process_AtendHeader(strcat('Figures/plot_',name,'.eps'),'');