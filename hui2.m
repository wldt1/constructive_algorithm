close all
% bi_best(747,1:2)=0;
% bi_best(194,1:2)=0;
% bi_best(585,1:2)=0;
zong=bi_best(1:2500,1);ce1=bi_best(1:2500,2);ce2=bi_best(1:2500,3);
edges=[0 0.01 0.1:0.1:1 2:1:10];
x=[0.005 0.055 0.15:0.1:0.95];
edges2=[0 0.01 0.1:0.1:1];
%max(zong)
h=histogram(zong,edges);
h2=histogram(ce1,edges2);
value_h2=h2.Values;
sum_h2=sum(h2.Values);
best_h2=h2.Values(1);
h3=histogram(ce2,edges2);
value_h3=h3.Values;
best_h3=h3.Values(1);
sum_h3=sum(h3.Values);
figure
h1=histogram(zong,edges2);
value_h1=h1.Values;
sum_h1=sum(h1.Values);
best_h1=h1.Values(1);
% hold on
% plot(x,h1.Values,'r-s','MarkerSize',12,'linewidth',2)
hold on
plot(x,value_h3,'b-o','MarkerSize',16,'linewidth',2)
hold on
plot(x,value_h2,'r-<','MarkerSize',16,'linewidth',2)
xlabel("Relative time overhead ratio",'Color','k')
ylabel("Frequency(n=1000)",'Color','k')

legend('Total Constructive Space','Strategy 1','Strategy 2','FontSize',20)
set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);
set(gca,'FontSize',22);
% zong<0;
% [z1,z2]=max(zong<0)
zong=bi_best(1:2500,7);ce1=bi_best(1:2500,8);ce2=bi_best(1:2500,9);
figure
edges3=[0 0.0001 0.001:0.001:0.01]/10;
x1=[0.0001/2 0.00055 0.0015:0.001:0.0095]/10;
% h=histogram(zong,edges3)
h2=histogram(ce1,edges3);
value1_h2=h2.Values;
sum1_h2=sum(h2.Values);
best1_h2=h2.Values(1);
h3=histogram(ce2,edges3);
value1_h3=h3.Values;
best1_h3=h3.Values(1);
sum1_h3=sum(h3.Values);
figure
h1=histogram(zong,edges3);
value1_h1=h1.Values;
sum1_h1=sum(h1.Values);
best1_h1=h1.Values(1);
% hold on
% plot(x,h1.Values,'r-s','MarkerSize',12,'linewidth',2)
hold on
plot(x1,value1_h3,'b-o','MarkerSize',16,'linewidth',2)
hold on
plot(x1,value1_h2,'r-<','MarkerSize',16,'linewidth',2)
xlabel("Solution scale ratio",'Color','k')
ylabel("Frequency(n=1000)",'Color','k')
legend('Total Constructive Space','Strategy 1','Strategy 2','FontSize',20)
set(gcf,'unit','normalized','position',[0.2,0.2,0.7,0.7]);
set(gca,'FontSize',22);