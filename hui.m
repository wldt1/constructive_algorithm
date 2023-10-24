close all;
Tg=[0.0003225 0.001016185 0.001337126 0.002854998];
Tb=[0.000873365 0.108760153 1.174793942 18.90544668];
Tr=[0.369260723 0.010334757 0.001284306 0.000173872];
x=1:4;
figure
xlabel("Scale",'Color','k')
yyaxis left;
plot(x,Tg,'r-s','MarkerSize',16,'linewidth',2);
hold on
plot(x,Tb,'b-o','MarkerSize',16,'linewidth',2);
ylabel("t/s",'Color','k')
set(gca,'YLim',[-0.5,25.5],'YColor','k')
yyaxis right;
plot(x,Tr,'--<','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2)

ylabel("Relative time overhead ratio",'Color','k')
set(gca,'YColor','k','YScale','log')
xticklabels({'S3 W4 T2 L3',"",'S12 W16 T8 L3',"",'S24 W32 T16 L3',"",'S48 W64 T32 L3'})
set(gca,'FontSize',22);
legend('Sg','Sb','Relative time overhead ratio\newline between Sg and Sb','FontSize',20)
set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);

T1=[0.005334393 0.274522439 2.792983142 38.92596591];
T2=[0.003246602 0.05550193 0.441375567 1.109963685];
Tr1=[0.032701558 0.022565914 0.020292353 0.014061886];
Tr2=[0.019902724 0.004671057 0.003583635 0.000460504];
figure
xlabel("Scale",'Color','k')
yyaxis left;
plot(x,T2,'b-s','MarkerSize',16,'linewidth',2);
hold on
plot(x,T1,'r-o','MarkerSize',16,'linewidth',2);
ylabel("t/s",'Color','k')
set(gca,'YLim',[-0.5,45.5],'YColor','k')
yyaxis right;
plot(x,Tr2,'--s','color',[0.12 0.56 1.00],'MarkerSize',16,'linewidth',2)
hold on
plot(x,Tr1,'--o','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2);
ylabel("Relative time overhead ratio",'Color','k')
set(gca,'YColor','k')
xticklabels({'S3 W4 T2 L3',"",'S12 W16 T8 L3',"",'S24 W32 T16 L3',"",'S48 W64 T32 L3'})
set(gca,'FontSize',22);
legend('Strategy 1','Strategy 2','Relative time overhead of strategy 1','Relative time overhead of strategy 2','FontSize',20)
set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);

S1=[0.060513545 0.01443556 0.002051359];
S2=[0.094562623 0.015922858 0.003276806];
S3=[0.072441202 0.0154562 0.003276806];
WD2=[3.996034786 6.146493371 6.626413544];
D2=[2.458588992 3.951197174 3.605321354];
C2=[0.482590699 0.57492984 0.453173993];
x=1:3;

figure

plot(x,S2,'-s','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2)
hold on
plot(x,S1,'r-o','MarkerSize',16,'linewidth',2)
hold on
%plot(x,S3,'-<','color',[1 0.27 0.00],'MarkerSize',16,'linewidth',2)
%hold on
plot(x,WD2,'-.s','color',[0.25 0.41 0.88],'MarkerSize',16,'linewidth',2)
hold on
plot(x,D2,'b-.o','MarkerSize',16,'linewidth',2)
hold on
plot(x,C2,'-.>','color',[0.12 0.56 1.00],'MarkerSize',16,'linewidth',2);
ylabel("Relative superiority",'Color','k')
set(gca,'YColor','k','YScale','log')
xlabel("Scale",'Color','k')
xticklabels({'S12 W16 T8 L3',"","","","",'S24 W32 T16 L3',"","","","",'S48 W64 T32 L3'})
set(gca,'FontSize',22);
%legend('Strategy 1','Strategy 2','Strategy 3','Weapon D2','D2','I2','FontSize',20,'NumColumnsMode','manual','NumColumns',2)
legend('Strategy 1','Strategy 2','Weapon D2','D2','I2','FontSize',20,'NumColumnsMode','manual','NumColumns',2)

set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);


% S1=[0.058683933 0.012089058 0.006532147];
% S2=[0.170518033 0.037073042 0.006532147];
% S3=[0.058683933 0.012746506 0.006532147];
% WD2=[8.158564051 2.095811904 1.572670779];
% D2=[3.680600788 1.398775069 1.036263471];
% C2=[0.720423393 0.612929795 0.31632229];
% figure
% 
% plot(x,S1,'-s','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2)
% hold on
% plot(x,S2,'r-o','MarkerSize',16,'linewidth',2)
% hold on
% plot(x,S3,'-<','color',[1 0.27 0.00],'MarkerSize',16,'linewidth',2)
% hold on
% plot(x,WD2,'-.s','color',[0.25 0.41 0.88],'MarkerSize',16,'linewidth',2)
% hold on
% plot(x,D2,'b-.o','MarkerSize',16,'linewidth',2)
% hold on
% plot(x,C2,'-.>','color',[0.12 0.56 1.00],'MarkerSize',16,'linewidth',2);
% ylabel("Relative superiority",'Color','k')
% set(gca,'YColor','k','YScale','log')
% xlabel("Scale",'Color','k')
% xticklabels({'S12 W16 T8 L3',"","","","",'S24 W32 T16 L3',"","","","",'S48 W64 T32 L3'})
% set(gca,'FontSize',22);
% legend('Strategy 1','Strategy 2','Strategy 3','Weapon D2','D2','C2','FontSize',20,'NumColumnsMode','manual','NumColumns',2)
% set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);


WAS11=[0.074605926 0.020146756 0.02270058];
WAS12=[0.02377575 0.009266302 0.012742997];
WAS13=[10^(-5) 10^(-5) 0.000258477];
WAS21=[0.074605926 0.020146756 0.065519689];
WAS22=[0.028964418 0.009344423 0.012742997];
WAS23=[10^(-5) 10^(-5) 0.000258477];

figure
plot(x,WAS21,'-s','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2)
hold on
plot(x,WAS22,'r-o','MarkerSize',16,'linewidth',2)
hold on
plot(x,WAS23,'-<','color',[1 0.27 0.00],'MarkerSize',16,'linewidth',2)
hold on
plot(x,WAS11,'-.s','color',[0.25 0.41 0.88],'MarkerSize',16,'linewidth',2)
hold on
plot(x,WAS12,'b-.o','MarkerSize',16,'linewidth',2)
hold on
plot(x,WAS13,'-.>','color',[0.12 0.56 1.00],'MarkerSize',16,'linewidth',2);
ylabel("Relative superiority",'Color','k')
set(gca,'YColor','k','YScale','log')
xlabel("Situation",'Color','k')
xticklabels({'Strong weapon\newline capabilities',"","","","",'Mix weapon\newline capabilities',"","","","",'Weak weapon\newline capabilities'})
set(gca,'FontSize',22);
legend('Strategy 1 in S12 W16 T8 L3','Strategy 1 in S24 W32 T16 L3','Strategy 1 in S48 W64 T32 L3','Strategy 2 in S12 W16 T8 L3','Strategy 2 in S24 W32 T16 L3','Strategy 2 in S48 W64 T32 L3','FontSize',20,'NumColumnsMode','manual','NumColumns',2)
set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);
% figure
% plot(x,WAS21./WAS11,'-s','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2)
% hold on
% plot(x,WAS22./WAS12,'r-o','MarkerSize',16,'linewidth',2)
% hold on
% plot(x,WAS23./WAS13,'-<','color',[1 0.27 0.00],'MarkerSize',16,'linewidth',2)
% ylabel("Relative superiority ratio",'Color','k')
% set(gca,'YColor','k')
% xlabel("Situation",'Color','k')
% xticklabels({'Strong weapon\newline capabilities',"","","","",'Mix weapon\newline capabilities',"","","","",'Weak weapon\newline capabilities'})
% set(gca,'FontSize',22);
% legend('S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3','FontSize',20)
% set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);

WFS11=[0.085692126 0.074605926 0.09821699];
WFS12=[0.026282103 0.02377575 0.013129216];
WFS13=[10^(-5) 10^(-5) 10^(-5)];
WFS21=[0.085692126 0.074605926 0.256650731];
WFS22=[0.026282103 0.028964418 0.013129216];
WFS23=[10^(-5) 10^(-5) 10^(-5)];

figure
plot(x,WFS21,'-s','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2);
hold on
plot(x,WFS22,'r-o','MarkerSize',16,'linewidth',2);
hold on
plot(x,WFS23,'-<','color',[1 0.27 0.00],'MarkerSize',16,'linewidth',2);
hold on
plot(x,WFS11,'-.s','color',[0.25 0.41 0.88],'MarkerSize',16,'linewidth',2);
hold on
plot(x,WFS12,'b-.o','MarkerSize',16,'linewidth',2);
hold on
plot(x,WFS13,'-.>','color',[0.12 0.56 1.00],'MarkerSize',16,'linewidth',2);
ylabel("Relative superiority",'Color','k')
set(gca,'YColor','k','YScale','log')
xlabel("Situation",'Color','k')
xticklabels({'Multiple feasible\newline allocations',"","","","",'Moderate feasible\newline allocations',"","","","",'Few feasible\newline allocations'})
set(gca,'FontSize',22);
legend('Strategy 1 in S12 W16 T8 L3','Strategy 1 in S24 W32 T16 L3','Strategy 1 in S48 W64 T32 L3','Strategy 2 in S12 W16 T8 L3','Strategy 2 in S24 W32 T16 L3','Strategy 2 in S48 W64 T32 L3','FontSize',20,'NumColumnsMode','manual','NumColumns',2)
set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);

% lgd = legend([line11,line12,line13],{'Strategy 1 in S12 W16 T8 L3','Strategy 1 in S24 W32 T16 L3','Strategy 1 in S48 W64 T32 L3'},'FontSize',16,'Location', 'northwest');
% axesNew = axes('position',get(gca,'position'),'visible','off');
% legend(axesNew,[line14,line15,line16],{'Strategy 2 in S12 W16 T8 L3','Strategy 2 in S24 W32 T16 L3','Strategy 2 in S48 W64 T32 L3'},'FontSize',16,'Location', 'southwest');

%legend(,,'FontSize',20)

% figure
% plot(x,WFS21./WFS11,'-s','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2)
% hold on
% plot(x,WFS22./WFS12,'r-o','MarkerSize',16,'linewidth',2)
% hold on
% plot(x,WFS23./WFS13,'-<','color',[1 0.27 0.00],'MarkerSize',16,'linewidth',2)
% 
% ylabel("Relative superiority ratio",'Color','k')
% set(gca,'YColor','k')
% xlabel("Situation",'Color','k')
% xticklabels({'Multiple feasible\newline allocations',"","","","",'Moderate feasible\newline allocations',"","","","",'Few feasible\newline allocations'})
% set(gca,'FontSize',22);
% legend('S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3','FontSize',20)
% set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);

SAS11=[0.074605926 0.017675775 0.024897563];
SAS12=[0.02377575 0.006844461 0.007588907];
SAS13=[10^(-5) 10^(-5) 0.007030236];
SAS21=[0.074605926 0.02053233 0.025219024];
SAS22=[0.028964418 0.006844461 0.007588907];
SAS23=[10^(-5) 10^(-5) 0.007030236];

figure
plot(x,SAS21,'-s','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2)
hold on
plot(x,SAS22,'r-o','MarkerSize',16,'linewidth',2)
hold on
plot(x,SAS23,'-<','color',[1 0.27 0.00],'MarkerSize',16,'linewidth',2)
hold on
plot(x,SAS11,'-.s','color',[0.25 0.41 0.88],'MarkerSize',16,'linewidth',2)
hold on
plot(x,SAS12,'b-.o','MarkerSize',16,'linewidth',2)
hold on
plot(x,SAS13,'-.>','color',[0.12 0.56 1.00],'MarkerSize',16,'linewidth',2);

ylabel("Relative superiority",'Color','k')
set(gca,'YColor','k','YScale','log')
xlabel("Situation",'Color','k')
xticklabels({'Strong sensor\newline capabilities',"","","","",'Mix sensor\newline capabilities',"","","","",'Weak sensor\newline capabilities'})
set(gca,'FontSize',22);
legend('Strategy 1 in S12 W16 T8 L3','Strategy 1 in S24 W32 T16 L3','Strategy 1 in S48 W64 T32 L3','Strategy 2 in S12 W16 T8 L3','Strategy 2 in S24 W32 T16 L3','Strategy 2 in S48 W64 T32 L3','FontSize',20)
set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);
% figure
% plot(x,SAS21./SAS11,'-s','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2)
% hold on
% plot(x,SAS22./SAS12,'r-o','MarkerSize',16,'linewidth',2)
% hold on
% plot(x,SAS23./SAS13,'-<','color',[1 0.27 0.00],'MarkerSize',16,'linewidth',2)
% ylabel("Relative superiority ratio",'Color','k')
% set(gca,'YColor','k')
% xlabel("Situation",'Color','k')
% xticklabels({'Strong sensor\newline capabilities',"","","","",'Mix sensor\newline capabilities',"","","","",'Weak sensor\newline capabilities'})
% set(gca,'FontSize',22);
% legend('S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3','FontSize',20)
% set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);

SFS11=[0.099392408 0.074605926 0.02834725];
SFS12=[0.030611366 0.02377575 10^(-5)];
SFS13=[0.015276238 10^(-5) 10^(-5)];
SFS21=[0.099392408 0.074605926 0.033575858];
SFS22=[0.039341104 0.028964418 10^(-5)];
SFS23=[0.02875615 10^(-5) 10^(-5)];

figure
line21=plot(x,SFS21,'-s','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2);
hold on
line22=plot(x,SFS22,'r-o','MarkerSize',16,'linewidth',2);
hold on
line23=plot(x,SFS23,'-<','color',[1 0.27 0.00],'MarkerSize',16,'linewidth',2);
hold on
line24=plot(x,SFS11,'-.s','color',[0.25 0.41 0.88],'MarkerSize',16,'linewidth',2);
hold on
line25=plot(x,SFS12,'b-.o','MarkerSize',16,'linewidth',2);
hold on
line26=plot(x,SFS13,'-.>','color',[0.12 0.56 1.00],'MarkerSize',16,'linewidth',2);
ylabel("Relative superiority",'Color','k')
set(gca,'YColor','k','YScale','log')
xlabel("Situation",'Color','k')
xticklabels({'Multiple feasible\newline allocations',"","","","",'Moderate feasible\newline allocations',"","","","",'Few feasible\newline allocations'})
set(gca,'FontSize',22);
%legend('Strategy 1 in S12 W16 T8 L3','Strategy 1 in S24 W32 T16 L3','Strategy 1 in S48 W64 T32 L3','Strategy 2 in S12 W16 T8 L3','Strategy 2 in S24 W32 T16 L3','Strategy 2 in S48 W64 T32 L3','FontSize',20)


lgd = legend([line21,line22,line23],{'Strategy 1 in S12 W16 T8 L3','Strategy 1 in S24 W32 T16 L3','Strategy 1 in S48 W64 T32 L3'},'FontSize',16,'Location', 'northwest');
axesNew = axes('position',get(gca,'position'),'visible','off');
legend(axesNew,[line24,line25,line26],{'Strategy 2 in S12 W16 T8 L3','Strategy 2 in S24 W32 T16 L3','Strategy 2 in S48 W64 T32 L3'},'FontSize',16,'Location', 'southwest');
set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);
% figure
% plot(x,SFS21./SFS11,'-s','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2)
% hold on
% plot(x,SFS22./SFS12,'r-o','MarkerSize',16,'linewidth',2)
% hold on
% plot(x,SFS23./SFS13,'-<','color',[1 0.27 0.00],'MarkerSize',16,'linewidth',2)
% ylabel("Relative superiority ratio",'Color','k')
% set(gca,'YColor','k','YScale','log','YTick',[1 10 100 1000 10000 100000 1000000 10000000 100000000])
% xlabel("Situation",'Color','k')
% xticklabels({'Multiple feasible\newline allocations',"","","","",'Moderate feasible\newline allocations',"","","","",'Few feasible\newline allocations'})
% set(gca,'FontSize',22);
% legend('S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3','FontSize',20)
% set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);

VFS11=[0.048561739 0.074605926 0.145411882];
VFS12=[10^(-5) 0.02377575 0.02855006];
VFS13=[10^(-5) 10^(-5) 10^(-5)];
VFS21=[0.048561739 0.074605926 0.310292263];
VFS22=[10^(-5) 0.028964418 0.030913813];
VFS23=[10^(-5) 10^(-5) 10^(-5)];



figure
plot(x,VFS21,'-s','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2)
hold on
plot(x,VFS22,'r-o','MarkerSize',16,'linewidth',2)
hold on
plot(x,VFS23,'-<','color',[1 0.27 0.00],'MarkerSize',16,'linewidth',2)
hold on
plot(x,VFS11,'-.s','color',[0.25 0.41 0.88],'MarkerSize',16,'linewidth',2)
hold on
plot(x,VFS12,'b-.o','MarkerSize',16,'linewidth',2)
hold on
plot(x,VFS13,'-.>','color',[0.12 0.56 1.00],'MarkerSize',16,'linewidth',2);
ylabel("Relative superiority",'Color','k')
set(gca,'YColor','k','YScale','log')
xlabel("Situation",'Color','k')
xticklabels({'Multiple feasible\newline allocations',"","","","",'Moderate feasible\newline allocations',"","","","",'Few feasible\newline allocations'})
set(gca,'FontSize',22);
legend('Strategy 1 in S12 W16 T8 L3','Strategy 1 in S24 W32 T16 L3','Strategy 1 in S48 W64 T32 L3','Strategy 2 in S12 W16 T8 L3','Strategy 2 in S24 W32 T16 L3','Strategy 2 in S48 W64 T32 L3','FontSize',20)
set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);
% figure
% plot(x,VFS21./VFS11,'-s','color',[0.89 0.09 0.05],'MarkerSize',16,'linewidth',2)
% hold on
% plot(x,VFS22./VFS12,'r-o','MarkerSize',16,'linewidth',2)
% hold on
% plot(x,VFS23./VFS13,'-<','color',[1 0.27 0.00],'MarkerSize',16,'linewidth',2)
% 
% ylabel("Relative superiority ratio",'Color','k')
% set(gca,'YColor','k')
% xlabel("Situation",'Color','k')
% xticklabels({'Multiple feasible\newline allocations',"","","","",'Moderate feasible\newline allocations',"","","","",'Few feasible\newline allocations'})
% set(gca,'FontSize',22);
% legend('S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3','FontSize',20)
% set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);


%{
WA1=[0.090229321	0.00659554	10^(-5);
0.016244057	0.002010057	10^(-5);
0.016977352	0.004144841	10^(-5)];
WA2=[0.156347848	0.023782044	10^(-5);
0.016244057	0.002010057	10^(-5);
0.035091833	0.023476325	10^(-5);
];

WA1=log10(WA1);
WA2=log10(WA2);


WK1=[0.079290915	0.001837524	0.0251696;
0.090229321	0.00659554	10^(-5);
0.09405325	0.013615113	0.035813814;
];
WK2=[0.245264743	0.001837524	0.0251696;
0.156347848	0.023782044	10^(-5);
0.161719658	0.013615113	0.035813814;
];

SA1=[0.090229321	0.00659554	10^(-5);
0.011280596	0.002406838	10^(-5);
0.020623314	0.003340698	0.004338053;
];
SA2=[0.156347848 0.023782044	10^(-5);
0.011280596	0.002406838	10^(-5);
0.020623314	0.003340698	0.004338053;
];

SK1=[0.063519215	0.082993826	10^(-5);
0.090229321	0.00659554	10^(-5);
0.069076056	0.00062527	10^(-5);
];
SK2=[0.809992391	0.134251238	134.3959486;
0.156347848	0.023782044	10^(-5);
0.074314645	0.00062527	10^(-5);];

V1=[0.087581453	0.006412444	10^(-5);
0.090229321	0.00659554	10^(-5);
0.097299482	0.008997489	10^(-5);
];
V2=[0.23555647	0.013644373	10^(-5);
0.156347848	0.023782044	10^(-5);
0.266257417	0.188813986	10^(-5)
];
% [X,Y] = meshgrid(1:1:3);
% figure
% subplot(121)
% mesh(X,Y,WA1)
% title("Strategy 1",'FontSize',14)
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3'})
% yticklabels({'Strong weapon \newline capabilities','Mix weapon \newline capabilities','Weak weapon \newline capabilities'})
% set(gca,'FontSize',22);
% subplot(122)
% mesh(X,Y,WA2)
% title("Strategy 2")
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3'})
% yticklabels({'Strong weapon \newline capabilities','Mix weapon \newline capabilities','Weak weapon \newline capabilities'})
% set(gca,'FontSize',22);
% figure
% mesh(X,Y,WA2-WA1)
% title("The difference between Strategy 1 and Strategy 2")
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3',' ','S24 W32 T16 L3',' ','S48 W64 T32 L3'})
% yticklabels({'Strong weapon \newline capabilities',' ','Mix weapon \newline capabilities',' ','Weak weapon \newline capabilities'})
% set(gca,'FontSize',22);
% WK1=log10(WK1);
% WK2=log10(WK2);
% figure
% subplot(121)
% mesh(X,Y,WK1)
% title("Strategy 1",'FontSize',14)
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3'})
% yticklabels({'Multiple feasible\newline allocations','Moderate feasible\newline allocations','Few feasible\newline allocations'})
% set(gca,'FontSize',22);
% subplot(122)
% mesh(X,Y,WK2)
% title("Strategy 2")
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3'})
% yticklabels({'Multiple feasible\newline allocations','Moderate feasible\newline allocations','Few feasible\newline allocations'})
% set(gca,'FontSize',22);
% figure
% mesh(X,Y,WK2-WK1)
% title("The difference between Strategy 1 and Strategy 2")
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3',' ','S24 W32 T16 L3',' ','S48 W64 T32 L3'})
% yticklabels({'Multiple feasible\newline allocations',' ','Moderate feasible\newline allocations',' ','Few feasible\newline allocations'})
% set(gca,'FontSize',22);
% 
% SA1=log10(SA1);
% SA2=log10(SA2);
% figure
% subplot(121)
% mesh(X,Y,SA1)
% title("Strategy 1",'FontSize',14)
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3'})
% yticklabels({'Strong season \newline capabilities','Mix season \newline capabilities','Weak season \newline capabilities'})
% set(gca,'FontSize',22);
% subplot(122)
% mesh(X,Y,SA2)
% title("Strategy 2")
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3'})
% yticklabels({'Strong season \newline capabilities','Mix season \newline capabilities','Weak season \newline capabilities'})
% set(gca,'FontSize',22);
% figure
% mesh(X,Y,SA2-SA1)
% title("The difference between Strategy 1 and Strategy 2")
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3',' ','S24 W32 T16 L3',' ','S48 W64 T32 L3'})
% yticklabels({'Strong season \newline capabilities',' ','Mix season \newline capabilities',' ','Weak season \newline capabilities'})
% set(gca,'FontSize',22);
% 
% SK1=log10(SK1);
% SK2=log10(SK2);
% figure
% subplot(121)
% mesh(X,Y,SK1)
% title("Strategy 1",'FontSize',14)
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3'})
% yticklabels({'Multiple feasible\newline allocations','Moderate feasible\newline allocations','Few feasible\newline allocations'})
% set(gca,'FontSize',22);
% subplot(122)
% mesh(X,Y,SK2)
% title("Strategy 2")
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3'})
% yticklabels({'Multiple feasible\newline allocations','Moderate feasible\newline allocations','Few feasible\newline allocations'})
% set(gca,'FontSize',22);
% figure
% mesh(X,Y,SK2-SK1)
% title("The difference between Strategy 1 and Strategy 2")
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3',' ','S24 W32 T16 L3',' ','S48 W64 T32 L3'})
% yticklabels({'Multiple feasible\newline allocations',' ','Moderate feasible\newline allocations',' ','Few feasible\newline allocations'})
% set(gca,'FontSize',22);
% V1=log10(V1);
% V2=log10(V2);
% figure
% subplot(121)
% mesh(X,Y,V1)
% title("Strategy 1",'FontSize',14)
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3'})
% yticklabels({'Significant\newline differences \newline','Moderate\newline differences \newline','Insignificant \newline differences \newline'})
% set(gca,'FontSize',22);
% subplot(122)
% mesh(X,Y,V2)
% title("Strategy 2")
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3','S24 W32 T16 L3','S48 W64 T32 L3'})
% yticklabels({'Significant\newline differences \newline','Moderate\newline differences \newline','Insignificant \newline differences \newline'})
% set(gca,'FontSize',21);
% figure
% mesh(X,Y,V2-V1)
% title("The difference between Strategy 1 and Strategy 2")
% xlabel("Scale",'FontSize',14)
% ylabel("Situation",'FontSize',14)
% zlabel("Logarithmic relative\newline superiority ratio",'FontSize',14)
% xticklabels({'S12 W16 T8 L3',' ','S24 W32 T16 L3',' ','S48 W64 T32 L3'})
% yticklabels({'Significant\newline differences \newline',' ','Moderate\newline differences \newline',' ','Insignificant \newline differences \newline'})
% set(gca,'FontSize',21);
%}