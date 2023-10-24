S=12;W=16;T=8;L=3;              %传感器数目、武器数目、来袭目标数目、目标预测轨迹的关键拦截点数目    
%%资源能力矩阵
al=0.75;ah=0.96;%%武器最大最小概率限制（0.5,0.64）
bl=0.75;bh=0.96;%%传感器最大最小概率限制
pian_s=0;pian_w=0;
wg=0.5;sg=0.5;li=8;
da=5;zhong=20;xiao=100;

%[J_b,J_z]=chong(3,4,2,3,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,xiao*50,1,0,1);

%P_q
%chong(S,W,T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,xiao,1,0,0);
%chong(2*S,2*W,2*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,zhong,1,0,0);
%chong(4*S,4*W,4*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,da,1,0,0);

%P_z
pian_w=1;
%chong(S,W,T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,xiao,1,0,0);
%chong(2*S,2*W,2*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,zhong,1,0,0);
%chong(4*S,4*W,4*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,da,1,0,0);
pian_w=0;


%P_r
al=0.75/1.5;ah=0.96/1.5;
%chong(S,W,T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,xiao,1,0,0);
%chong(2*S,2*W,2*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,zhong,1,0,0);
%chong(4*S,4*W,4*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,da,1,0,0);
al=0.75;ah=0.96;

%%P_qiang
wg=0.7;
% chong(S,W,T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,xiao,1,0,0);
% chong(2*S,2*W,2*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,zhong,1,0,0);
% chong(4*S,4*W,4*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,da,1,0,0);
%%P_que
wg=0.3;
% chong(S,W,T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,xiao,1,0,0);
% chong(2*S,2*W,2*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,zhong,1,0,0);
% chong(4*S,4*W,4*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,da,1,0,0);
wg=0.5;

pian_s=1;
%chong(S,W,T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,xiao,1,0,0);
%chong(2*S,2*W,2*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,zhong,1,0,0);
%chong(4*S,4*W,4*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,da,1,0,0);
pian_s=0;

bl=0.75/1.5;bh=0.96/1.5;
% chong(S,W,T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,xiao,1,0,0);
% chong(2*S,2*W,2*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,zhong,1,0,0);
% chong(4*S,4*W,4*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,da,1,0,0);
bl=0.75;bh=0.96;

%%Q_qiang
sg=0.7;
%chong(S,W,T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,xiao,1,0,0);
%chong(2*S,2*W,2*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,zhong,1,0,0);
%chong(4*S,4*W,4*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,da,1,0,0);

%%Q_que
sg=0.3;
%chong(S,W,T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,xiao,1,0,0);
%chong(2*S,2*W,2*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,zhong,1,0,0);
% chong(4*S,4*W,4*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,da,1,0,0);
sg=0.5;

%%V_cha da
li=4;
%chong(S,W,T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,xiao,1,0,0);
%chong(2*S,2*W,2*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,zhong,1,0,0);
%chong(4*S,4*W,4*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,da,1,0,0);

%%V_cha xiao
li=16;
%chong(S,W,T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,xiao,1,0,0);
%chong(2*S,2*W,2*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,zhong,1,0,0);
%chong(4*S,4*W,4*T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,da,1,0,0);
li=8;

close all