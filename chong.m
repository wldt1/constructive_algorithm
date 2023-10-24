function [bi_best,bi_data]=chong(S,W,T,L,al,ah,bl,bh,wg,sg,pian_s,pian_w,li,numms,qi,flag_fu,flag_best)
close all
t3=tic;
% %问题参数及参数矩阵初始化
% S=6;               %传感器数目
% W=7;              %武器数目
% T=3;               %来袭目标数目
% L=3;               %目标预测轨迹的关键拦截点数目
% %%资源能力矩阵
% al=0.72;ah=0.96;%%武器最大最小概率限制
% bl=0.72;bh=0.96;%%传感器最大最小概率限制
% gwl=40;gsl=40;
X=floor(S/6);
bi_best=zeros(9,numms);
bi_data=zeros(12,numms);
if X==0
    X=1;end
%numms=100;
t_zong=zeros(6,1);
foldername="S";
% pian_s=0;pian_w=0;
flag_save=1;
excel_save=1;
%%文件名参数设置
if flag_save==1    
    foldername=strcat(foldername,num2str(S));
    foldername=strcat(foldername," W");
    foldername=strcat(foldername,num2str(W));
    foldername=strcat(foldername," T");
    foldername=strcat(foldername,num2str(T));
    foldername=strcat(foldername," L");
    foldername=strcat(foldername,num2str(L));
    foldername=strcat(foldername," wl");
    foldername=strcat(foldername,num2str(al));
    foldername=strcat(foldername," wh");
    foldername=strcat(foldername,num2str(ah));
    foldername=strcat(foldername," wg");
    foldername=strcat(foldername,num2str(wg));
    foldername=strcat(foldername," sl");
    foldername=strcat(foldername,num2str(bl));
    foldername=strcat(foldername," sh");
    foldername=strcat(foldername,num2str(bh));
    foldername=strcat(foldername," sg");
    foldername=strcat(foldername,num2str(sg));
    if pian_s==1
       foldername=strcat(foldername," s_chu");
    end
    if pian_w==1
       foldername=strcat(foldername," w_chu");
    end
    foldername=strcat(foldername," bei");
    foldername=strcat(foldername,num2str(li));
    mkdir(foldername)    
end
    foldername=strcat(foldername,'\');
if excel_save==1
    warning off MATLAB:xlswrite:AddSheet 
    excelname='C:\Users\15822\Desktop\与导师的交流\大三上\SWTA\确定性算法\';
    excelname=strcat(excelname,foldername);
    excelname=strcat(excelname,"data.xlsx");
    xlsbiaotou_cun_bian={"序号","总时间开销","第二个函数值","最优值","最优位置","最差值","最差位置","全局峰峰值","稳态起始点","循环节数","稳态最优","稳态最差","稳态峰峰值"};
    xlsbiaotou_cun_gou={"序号","总时间开销","最优值","最优位置","最差值","最差位置","全局峰峰值","稳态起始点","循环节数","稳态最优","稳态最差","稳态峰峰值"};
    xlsbiaotou_hun={"序号","总时间开销","最优值","最优位置","最差值","最差位置","全局峰峰值","B->G","B->Gtimes","G->B","G->Btimes","G->G","G->Gtimes","B->B","B->Btimes"};
    xlsbiaotou_J={"序号","最优值","最优值位置","最优值归属","S_边","S_构","S_混","W_边","W_构","W_混","S_边2","W_边2","WS_边优","WS_边稳","WS_构优","WS_构稳","策略1优解","策略2优解","混合优解","S_边2优况","S_边2最优况","W_边2最优况","循环节起始点_W边","循环节起始点_S边","循环节节数_W边","循环节节数_S边","循环节起始点_W构","循环节起始点_S构","循环节节数_W构","循环节节数_S构","边_循环节起始点","边_循环节节数","边_无循环比例","构_循环节起始点","构_循环节节数","构_无循环比例","策略1不算最优解","策略2不算最优解","策略1最优占比","策略2最优占比","策略1.5优解","王艺鹏博士优解","2边","2构"};
    xlsbiaotou_time={"序号","W构","S构","S边","策略1","S构(2)","总","混总"};
    xlswrite(excelname,xlsbiaotou_cun_bian,'S_bian','A2')
    xlswrite(excelname,xlsbiaotou_cun_bian,'W_bian','A2')
    xlswrite(excelname,xlsbiaotou_cun_gou,'S_gou','A2')
    xlswrite(excelname,xlsbiaotou_cun_gou,'W_gou','A2')
    xlswrite(excelname,xlsbiaotou_hun,'W_hun','A2')
    xlswrite(excelname,xlsbiaotou_hun,'S_hun','A2')
    xlswrite(excelname,xlsbiaotou_J,'J_zong','A2')
    xlswrite(excelname,xlsbiaotou_time,'time_zong','A2')
    excellocation=strcat("A",num2str(numms+4));
    xlswrite(excelname,xlsbiaotou_cun_bian,'S_bian',excellocation)
    xlswrite(excelname,xlsbiaotou_cun_bian,'W_bian',excellocation)
    xlswrite(excelname,xlsbiaotou_cun_gou,'S_gou',excellocation)
    xlswrite(excelname,xlsbiaotou_cun_gou,'W_gou',excellocation)
    xlswrite(excelname,xlsbiaotou_hun,'W_hun',excellocation)
    xlswrite(excelname,xlsbiaotou_hun,'S_hun',excellocation)
    xlswrite(excelname,xlsbiaotou_J,'J_zong',excellocation)
    xlswrite(excelname,xlsbiaotou_time,'time_zong',excellocation)
end
xin_b_s_z=zeros(1,13);
xin_g_s_z=zeros(1,12); 
xin_b_w_z=zeros(1,13);
xin_g_w_z=zeros(1,12); 
xin_time_z=zeros(1,8);
xin_zong_z=zeros(1,44);
bwn=0;bsn=0;gsn=0;gwn=0;ce1n=0;ce2n=0;
for ii=qi:numms
    t2=tic;
    %%资源能力矩阵
    if flag_fu==0
        WAB=al+(ah-al)*rand(W,T,L);%武器毁伤概率矩阵
        SAB=bl+(bh-bl)*rand(S,T,L); %传感器能力矩阵
        %%资源可行性矩阵
        WAC=(rand(W,T,L)+wg-1)>0;
        WAC=double(WAC);%%让武器可行性矩阵F中每个元素有1/6的概率为0,5/6的概率为1
        if pian_w==1
            WAB=WAB/1.5;
            SAB=SAB/1.5;
            for i=1:W
                for l=1:L
                    g=rand;        
                    if g<0.5
                        t=randi(T);
                        WAB(i,t,l)=WAB(i,t,l)*1.5;
                    else
                        z=randperm(T);
                        if g<0.9 || T<3
                            WAB(i,z(1),l)=WAB(i,z(1),l)*1.5;
                            WAB(i,z(2),l)=WAB(i,z(2),l)*1.5;
                        else
                            WAB(i,z(1),l)=WAB(i,z(1),l)*1.5;
                            WAB(i,z(2),l)=WAB(i,z(2),l)*1.5;
                            WAB(i,z(3),l)=WAB(i,z(3),l)*1.5;
                        end
                    end
                end
            end
        end
        SAC=(rand(S,T,L)+sg-1)>0;
        SAC=double(SAC);%%让武器可行性矩阵F中每个元素有1/6的概率为0,5/6的概率为1
        if pian_s==1
            SAB=SAB/1.5;
            WAB=WAB/1.5;
            for i=1:S
                for l=1:L
                    g=rand;        
                    if g<0.5
                        t=randi(T);
                        SAB(i,t,l)=SAB(i,t,l)*1.5;
                    else
                        z=randperm(T);
                        if g<0.9 || T<3
                            SAB(i,z(1),l)=SAB(i,z(1),l)*1.5;
                            SAB(i,z(2),l)=SAB(i,z(2),l)*1.5;
                        else
                            SAB(i,z(1),l)=SAB(i,z(1),l)*1.5;
                            SAB(i,z(2),l)=SAB(i,z(2),l)*1.5;
                            SAB(i,z(3),l)=SAB(i,z(3),l)*1.5;
                        end
                    end
                end
            end
        end
        V=1/T+1/li/T.*randn(1, T);      %目标威胁值矩阵
        V=V/sum(V);
        %%资源数目限制矩阵(基于目标威胁值矩阵，符合常理)
        WN=zeros(1,T);SN=zeros(1,T); %允许同时分配给目标的武器和传感器数目矩阵
        for i=1:T
            if V(i)<=0.5
                 WN(i)=floor(W*L/T)-1;SN(i)=1*X;
        %          WN(i)=T*L;SN(i)=1*X;
            end
            if 0.5<V(i)&&V(i)<=0.9
                 WN(i)=floor(W*L/T);SN(i)=2*X;
        %          WN(i)=W;SN(i)=1*X;
            end
            if 0.9<V(i)
                 WN(i)=floor(W*L/T)+1;SN(i)=3*X;
                % WN(i)=W+1;SN(i)=1*X;
            end
        end

        WM=zeros(1,W);%%范围是L-2到L个
        WMj=sum(WAB,[2,3]);
        WMj=(WMj-min(WMj))/(max(WMj)-min(WMj));
        for w=1:W
            for wm=1:3
                if WMj(w)<=wm/3
                    WM(w)=L+1-wm;
                    break;
                end
            end
        end
    else
        matname=strcat(foldername,num2str(ii));
        matname=strcat(matname,'.mat');
        load(matname)
    end
    
    nums=100;num=[];excellocation=strcat("A",num2str(ii+2));
    wtimes=0;sbtimes=0;sgtimes=0;
    wtime=[];sbtime=[];sgtime=[];
    
    
    PBkm_b_s=ones(T,L,nums+1);
    PCkL_b_s=zeros(T,L,nums);
    Jb_s=zeros(1,2*nums);
    Fw_b_s=zeros(W,L,nums);
    Fs_b_s=zeros(S,L,nums);
    xin_b_s=zeros(1,13); 
    flag_chong=0; 
    t1=0;
    for i=1:nums
        [PCkL_b_s(:,:,i),tsb,Fs_b_s(:,:,i),Jb_s(2*i-1)]=deter_S_b_you(S,T,L,V,SAC,SAB,SN,PBkm_b_s(:,:,i));
        [PBkm_b_s(:,:,i+1),tw,Fw_b_s(:,:,i),Jb_s(2*i)]=deter_W(W,T,L,V,WAB,WAC,WN,WM,PCkL_b_s(:,:,i));
        num=[num 2*i-1 2*i];
        wtime=[wtime tw];wtimes=wtimes+1;
        sbtime=[sbtime tsb];sbtimes=sbtimes+1;
        t1=t1+tw+tsb;
       
        for j=i-1:-1:1 %%补充没有循环节的情况
            if Jb_s(2*i)==Jb_s(2*j) 
                if Jb_s(2*i-1)==Jb_s(2*j-1)
                    if PCkL_b_s(:,:,i)==PCkL_b_s(:,:,j)
                        if PBkm_b_s(:,:,i+1)==PBkm_b_s(:,:,j+1)
                            flag_chong=1;
                            xin_b_s(9)=j*2;%%稳态值开始点
                            xin_b_s(10)=i-1-j+1;%%循环节数
                            if Jb_s(2*j)==Jb_s(2*j-1)
                                xin_b_s(10)=xin_b_s(10)-0.5;
                            end
                            %稳定值最优值，稳定值最差值
                            xin_b_s(11)=min(Jb_s(2*j),Jb_s(2*j-1));
                            xin_b_s(12)=max(Jb_s(2*j),Jb_s(2*j-1));
                            for k=j+1:i-1
                                if xin_b_s(11)>min(Jb_s(2*k),Jb_s(2*k-1))
                                    xin_b_s(11)=min(Jb_s(2*k),Jb_s(2*k-1));
                                end
                                if xin_b_s(12)<max(Jb_s(2*k),Jb_s(2*k-1))
                                    xin_b_s(12)=max(Jb_s(2*k),Jb_s(2*k-1));
                                end
                            end
                            xin_b_s(13)=xin_b_s(12)-xin_b_s(11);
                            %%对J数据进行补齐
                            xun=xin_b_s(10)*2;add=0;
                            for k=2*i-1:2*nums
                                Jb_s(k)=Jb_s(xin_b_s(9)+add);
                                num(k)=k;
                                add=rem(add+1,xun);
                            end
                            break;
                        end
                    end
                end
            end
        end
        if flag_chong==1
            break;
        end
    end
    xin_b_s(1)=ii;
    xin_b_s(2)=t1;
    t_zong(1)=t_zong(1)+xin_b_s(2)/numms;
    xin_b_s(3)=Jb_s(2);
    [xin_b_s(4),xin_b_s(5)]=min(Jb_s(2:end));
    
    [xin_b_s(6),xin_b_s(7)]=max(Jb_s(2:end));
    xin_b_s(5)=xin_b_s(5)+1;
    best=xin_b_s(4);best_index=xin_b_s(5);best_chuang=1;
    xin_b_s(7)=xin_b_s(7)+1;
    xin_b_s(8)=xin_b_s(6)-xin_b_s(4);
    xlswrite(excelname,num2cell(xin_b_s),'S_bian',excellocation)
    xin_b_s_z(10)=xin_b_s_z(10)+xin_b_s(10)/numms;
    xin_b_s_z(9)=xin_b_s_z(9)+xin_b_s(9)/numms;
    if flag_best==0
        figure
    end
    hold on
    plot(num(2:end),Jb_s(2:end),"-r+")

    
    PBkm_g_s=ones(T,L,nums+1);
    PCkL_g_s=zeros(T,L,nums);
    Jg_s=zeros(1,2*nums);
    Fw_g_s=zeros(W,L,nums);
    Fs_g_s=zeros(S,L,nums);
    
    xin_g_s=zeros(1,12); 
    flag_chong=0; 
    t1=0;
    for i=1:nums
        [PCkL_g_s(:,:,i),tsg,Fs_g_s(:,:,i),Jg_s(2*i-1)]=deter_S_g_max(S,T,L,V,SAC,SAB,SN,PBkm_g_s(:,:,i));
        [PBkm_g_s(:,:,i+1),tw,Fw_g_s(:,:,i),Jg_s(2*i)]=deter_W(W,T,L,V,WAB,WAC,WN,WM,PCkL_g_s(:,:,i));
        wtime=[wtime tw];wtimes=wtimes+1;
        sgtime=[sgtime tsg];sgtimes=sgtimes+1;
        t1=t1+tw+tsg;
        for j=i-1:-1:1
            if Jg_s(2*i)==Jg_s(2*j)
                if Jg_s(2*i-1)==Jg_s(2*j-1)
                    if PCkL_g_s(:,:,i)==PCkL_g_s(:,:,j)
                        if PBkm_g_s(:,:,i+1)==PBkm_g_s(:,:,j+1)
                            flag_chong=1;
                            xin_g_s(8)=j*2;%%稳态值开始点
                            xin_g_s(9)=i-1-j+1;%%循环节数
                            if Jg_s(2*j)==Jg_s(2*j-1)
                                xin_g_s(9)=xin_g_s(9)-0.5;
                            end
                            %稳定值最优值，稳定值最差值
                            xin_g_s(10)=min(Jg_s(2*j),Jg_s(2*j-1));
                            xin_g_s(11)=max(Jg_s(2*j),Jg_s(2*j-1));
                            for k=j+1:i-1
                                if xin_g_s(10)>min(Jg_s(2*k),Jg_s(2*k-1))
                                    xin_g_s(10)=min(Jg_s(2*k),Jg_s(2*k-1));
                                end
                                if xin_g_s(11)<max(Jg_s(2*k),Jg_s(2*k-1))
                                    xin_g_s(11)=max(Jg_s(2*k),Jg_s(2*k-1));
                                end
                            end
                            xin_g_s(12)=xin_g_s(11)-xin_g_s(10);
                            %%对J数据进行补齐
                            xun=xin_g_s(9)*2;add=0;
                            for k=2*i-1:2*nums
                                Jg_s(k)=Jg_s(xin_g_s(8)+add);
                                add=rem(add+1,xun);
                            end
                            break;
                        end
                    end
                end
            end
        end
        if flag_chong==1
            break;
        end
    end
    xin_g_s(1)=ii;
    xin_g_s(2)=t1;
    t_zong(2)=t_zong(2)+xin_g_s(2)/numms;
    [xin_g_s(3),xin_g_s(4)]=min(Jg_s(2:end));
    
    [xin_g_s(5),xin_g_s(6)]=max(Jg_s(2:end));
    xin_g_s(4)=xin_g_s(4)+1;
    if best>xin_g_s(3)
        best=xin_g_s(3);best_index=xin_g_s(4);best_chuang=2;
    end
    xin_g_s(6)=xin_g_s(6)+1;
    xin_g_s(7)=xin_g_s(5)-xin_g_s(3);
    xin_g_s_z(8)=xin_g_s_z(8)+xin_g_s(8)/numms;
    xin_g_s_z(9)=xin_g_s_z(9)+xin_g_s(9)/numms;
    xlswrite(excelname,num2cell(xin_g_s),'S_gou',excellocation)

    plot(num(2:end),Jg_s(2:end),"-ro")

    PBkm_bg_s=ones(T,L,nums+1);
    PCkL_bg_s=zeros(T,L,nums);
    Jbg_s=zeros(1,2*nums);
    bian_s=zeros(1,nums);
    bians_s=1;
    xin_bg_s=zeros(1,15); 
    t1=0;
    flag_bg=-1;
    for i=1:nums
        if rand<0.5
            [PCkL_bg_s(:,:,i),tsb,~,Jbg_s(2*i-1)]=deter_S_b_you(S,T,L,V,SAC,SAB,SN,PBkm_bg_s(:,:,i));
            bian_s(bians_s)=i;
            bians_s=bians_s+1;
            sbtime=[sbtime tsb];sbtimes=sbtimes+1;
            t1=t1+tsb;
            if flag_bg==1
                xin_bg_s(15)=xin_bg_s(15)+1;
                xin_bg_s(14)=xin_bg_s(14)+(Jbg_s(2*i-1)-Jbg_s(2*(i-1)-1))/Jbg_s(2*(i-1)-1);
            end
            if flag_bg==0
                xin_bg_s(11)=xin_bg_s(11)+1;
                xin_bg_s(10)=xin_bg_s(10)+(Jbg_s(2*i-1)-Jbg_s(2*(i-1)-1))/Jbg_s(2*(i-1)-1);
            end
            flag_bg=1;
        else
            [PCkL_bg_s(:,:,i),tsg,~,Jbg_s(2*i-1)]=deter_S_g_max(S,T,L,V,SAC,SAB,SN,PBkm_bg_s(:,:,i));
            sgtime=[sgtime tsg];sgtimes=sgtimes+1;
            t1=t1+tsg;
            if flag_bg==1
                xin_bg_s(9)=xin_bg_s(9)+1;
                xin_bg_s(8)=xin_bg_s(8)+(Jbg_s(2*i-1)-Jbg_s(2*(i-1)-1))/Jbg_s(2*(i-1)-1);
            end
            if flag_bg==0
                xin_bg_s(13)=xin_bg_s(13)+1;
                xin_bg_s(12)=xin_bg_s(12)+(Jbg_s(2*i-1)-Jbg_s(2*(i-1)-1))/Jbg_s(2*(i-1)-1);
            end
            flag_bg=0;
        end
        [PBkm_bg_s(:,:,i+1),tw,~,Jbg_s(2*i)]=deter_W(W,T,L,V,WAB,WAC,WN,WM,PCkL_bg_s(:,:,i));
         wtime=[wtime tw];wtimes=wtimes+1;
         t1=t1+tw;
    end
    xin_bg_s(1)=ii;
    xin_bg_s(2)=t1;
    t_zong(3)=t_zong(3)+xin_bg_s(2)/numms;
    [xin_bg_s(3),xin_bg_s(4)]=min(Jbg_s(2:end));

    [xin_bg_s(5),xin_bg_s(6)]=max(Jbg_s(2:end));
    xin_bg_s(4)=xin_bg_s(4)+1;
    if best>xin_bg_s(3)
        best=xin_bg_s(3);best_index=xin_bg_s(4);best_chuang=3;
    end
    xin_bg_s(6)=xin_bg_s(6)+1;
    xin_bg_s(7)=xin_bg_s(5)-xin_bg_s(3);
    xlswrite(excelname,num2cell(xin_bg_s),'S_hun',excellocation)
    
    plot(num(2:end),Jbg_s(2:end),"-rs")
    
    
    PBkm_b_w=zeros(T,L,nums);
    PCkL_b_w=ones(T,L,nums+1);
    Jb_w=zeros(1,2*nums);
    Fw_b_w=zeros(W,L,nums);
    Fs_b_w=zeros(S,L,nums);

    xin_b_w=zeros(1,13); 
    flag_chong=0; 
    t1=0;
    for i=1:nums
        [PBkm_b_w(:,:,i),tw,Fw_b_w(:,:,i),Jb_w(2*i-1)]=deter_W(W,T,L,V,WAB,WAC,WN,WM,PCkL_b_w(:,:,i));
        [PCkL_b_w(:,:,i+1),tsb,Fs_b_w(:,:,i),Jb_w(2*i)]=deter_S_b_you(S,T,L,V,SAC,SAB,SN,PBkm_b_w(:,:,i));
        wtime=[wtime tw];wtimes=wtimes+1;
        sbtime=[sbtime tsb];sbtimes=sbtimes+1;
        t1=t1+tw+tsb;
        for j=i-1:-1:1
            if Jb_w(2*i)==Jb_w(2*j)
                if Jb_w(2*i-1)==Jb_w(2*j-1)
                    if PCkL_b_w(:,:,i+1)==PCkL_b_w(:,:,j+1)
                        if PBkm_b_w(:,:,i)==PBkm_b_w(:,:,j)
                            flag_chong=1;
                            xin_b_w(9)=j*2;%%稳态值开始点
                            xin_b_w(10)=i-1-j+1;%%循环节数
                            if Jb_w(2*j)==Jb_w(2*j-1)
                                xin_b_w(10)=xin_b_w(10)-0.5;
                            end
                            %稳定值最优值，稳定值最差值
                            xin_b_w(11)=min(Jb_w(2*j),Jb_w(2*j-1));
                            xin_b_w(12)=max(Jb_w(2*j),Jb_w(2*j-1));
                            for k=j+1:i-1
                                if xin_b_w(11)>min(Jb_w(2*k),Jb_w(2*k-1))
                                    xin_b_w(11)=min(Jb_w(2*k),Jb_w(2*k-1));
                                end
                                if xin_b_w(12)<max(Jb_w(2*k),Jb_w(2*k-1))
                                    xin_b_w(12)=max(Jb_w(2*k),Jb_w(2*k-1));
                                end
                            end
                            xin_b_w(13)=xin_b_w(12)-xin_b_w(11);
                            %%对J数据进行补齐
                            xun=xin_b_w(10)*2;add=0;
                            for k=2*i-1:2*nums
                                Jb_w(k)=Jb_w(xin_b_w(9)+add);
                                add=rem(add+1,xun);
                            end
                            break;
                        end
                    end
                end
            end
        end
        if flag_chong==1
            break;
        end
    end
    xin_b_w(1)=ii;
    xin_b_w(2)=t1;
    t_zong(4)=t_zong(4)+xin_b_w(2)/numms;
    xin_b_w(3)=Jb_w(2);
    [xin_b_w(4),xin_b_w(5)]=min(Jb_w(2:end));
    
    [xin_b_w(6),xin_b_w(7)]=max(Jb_w(2:end));
    xin_b_w(5)=xin_b_w(5)+1;
    if best>xin_b_w(4)
        best=xin_b_w(4);best_index=xin_b_w(5);best_chuang=4;
    end
    xin_b_w(7)=xin_b_w(7)+1;
    xin_b_w(8)=xin_b_w(6)-xin_b_w(4);
    xin_b_w_z(10)=xin_b_w_z(10)+xin_b_w(10)/numms;
    xin_b_w_z(9)=xin_b_w_z(9)+xin_b_w(9)/numms;
    xlswrite(excelname,num2cell(xin_b_w),'W_bian',excellocation)
    
    plot(num(2:end),Jb_w(2:end),"-b+")
    
    PBkm_g_w=zeros(T,L,nums);
    PCkL_g_w=ones(T,L,nums+1);
    Jg_w=zeros(1,2*nums);
    Fw_g_w=zeros(W,L,nums);
    Fs_g_w=zeros(S,L,nums);
    
    xin_g_w=zeros(1,12); 
    flag_chong=0; 
    t1=0;
    for i=1:nums
        [PBkm_g_w(:,:,i),tw,Fw_g_w(:,:,i),Jg_w(2*i-1)]=deter_W(W,T,L,V,WAB,WAC,WN,WM,PCkL_g_w(:,:,i));
        [PCkL_g_w(:,:,i+1),tsg,Fs_g_w(:,:,i),Jg_w(2*i)]=deter_S_g_max(S,T,L,V,SAC,SAB,SN,PBkm_g_w(:,:,i));
        wtime=[wtime tw];wtimes=wtimes+1;
        sgtime=[sgtime tsg];sgtimes=sgtimes+1;
        t1=t1+tw+tsg;
        for j=i-1:-1:1
            if Jg_w(2*i)==Jg_w(2*j)
                if Jg_w(2*i-1)==Jg_w(2*j-1)
                    if PCkL_g_w(:,:,i+1)==PCkL_g_w(:,:,j+1)
                        if PBkm_g_w(:,:,i)==PBkm_g_w(:,:,j)
                            flag_chong=1;
                            xin_g_w(8)=j*2;%%稳态值开始点
                            xin_g_w(9)=i-1-j+1;%%循环节数
                            if Jg_w(2*j)==Jg_w(2*j-1)
                                xin_g_w(9)=xin_g_w(9)-0.5;
                            end
                            %稳定值最优值，稳定值最差值
                            xin_g_w(10)=min(Jg_w(2*j),Jg_w(2*j-1));
                            xin_g_w(11)=max(Jg_w(2*j),Jg_w(2*j-1));
                            for k=j+1:i-1
                                if xin_g_w(10)>min(Jg_w(2*k),Jg_w(2*k-1))
                                    xin_g_w(10)=min(Jg_w(2*k),Jg_w(2*k-1));
                                end
                                if xin_g_w(11)<max(Jg_w(2*k),Jg_w(2*k-1))
                                    xin_g_w(11)=max(Jg_w(2*k),Jg_w(2*k-1));
                                end
                            end
                            xin_g_w(12)=xin_g_w(11)-xin_g_w(10);
                            %%对J数据进行补齐
                            xun=xin_g_w(9)*2;add=0;
                            for k=2*i-1:2*nums
                                Jg_w(k)=Jg_w(xin_g_w(8)+add);
                                add=rem(add+1,xun);
                            end
                            break;
                        end
                    end
                end
            end
        end
        if flag_chong==1
            break;
        end
    end
    xin_g_w(1)=ii;
    xin_g_w(2)=t1;
    t_zong(5)=t_zong(5)+xin_g_w(2)/numms;
    [xin_g_w(3),xin_g_w(4)]=min(Jg_w(2:end));
    
    [xin_g_w(5),xin_g_w(6)]=max(Jg_w(2:end));
    xin_g_w(4)=xin_g_w(4)+1;
    if best>xin_g_w(3)
        best=xin_g_w(3);best_index=xin_g_w(4);best_chuang=5;
    end
    xin_g_w(6)=xin_g_w(6)+1;
    xin_g_w(7)=xin_g_w(5)-xin_g_w(3);
    xlswrite(excelname,num2cell(xin_g_w),'W_gou',excellocation)
    xin_g_w_z(8)=xin_g_w_z(8)+xin_g_w(8)/numms;
    xin_g_w_z(9)=xin_g_w_z(9)+xin_g_w(9)/numms;
    
    plot(num(2:end),Jg_w(2:end),"-bo")
        
    PBkm_bg_w=zeros(T,L,nums);
    PCkL_bg_w=ones(T,L,nums+1);
    Jbg_w=zeros(1,2*nums);
    bian_w=zeros(1,nums);
    bians_w=1;
    xin_bg_w=zeros(1,15); 
    t1=0;
    flag_bg=-1;
    for i=1:nums
        [PBkm_bg_w(:,:,i),tw,Fg_wsw_max,Jbg_w(2*i-1)]=deter_W(W,T,L,V,WAB,WAC,WN,WM,PCkL_bg_w(:,:,i));
        wtime=[wtime tw];wtimes=wtimes+1;
        t1=t1+tw;
        if rand<0.5
            [PCkL_bg_w(:,:,i+1),t(6,2*i-1),Fg_ws_max,Jbg_w(2*i)]=deter_S_b_you(S,T,L,V,SAC,SAB,SN,PBkm_bg_w(:,:,i));
            bian_w(bians_w)=i;
            bians_w=bians_w+1;
            sbtime=[sbtime tsb];sbtimes=sbtimes+1;
            t1=t1+tsb;
            if flag_bg==1
                xin_bg_w(15)=xin_bg_w(15)+1;
                xin_bg_w(14)=xin_bg_w(14)+(Jbg_w(2*i-1)-Jbg_w(2*(i-1)-1))/Jbg_w(2*(i-1)-1);
            end
            if flag_bg==0
                xin_bg_w(11)=xin_bg_w(11)+1;
                xin_bg_w(10)=xin_bg_w(10)+(Jbg_w(2*i-1)-Jbg_w(2*(i-1)-1))/Jbg_w(2*(i-1)-1);
            end
            flag_bg=1;
        else
            [PCkL_bg_w(:,:,i+1),t(6,2*i-1),Fg_ws_max,Jbg_w(2*i)]=deter_S_g_max(S,T,L,V,SAC,SAB,SN,PBkm_bg_w(:,:,i));
            sgtime=[sgtime tsg];sgtimes=sgtimes+1;
            t1=t1+tsg;
            if flag_bg==1
                xin_bg_w(9)=xin_bg_w(9)+1;
                xin_bg_w(8)=xin_bg_w(8)+(Jbg_w(2*i-1)-Jbg_w(2*(i-1)-1))/Jbg_w(2*(i-1)-1);
            end
            if flag_bg==0
                xin_bg_w(13)=xin_bg_w(13)+1;
                xin_bg_w(12)=xin_bg_w(12)+(Jbg_w(2*i-1)-Jbg_w(2*(i-1)-1))/Jbg_w(2*(i-1)-1);
            end
            flag_bg=0;
        end
    end
    xin_bg_w(1)=ii;
    xin_bg_w(2)=t1;
    t_zong(6)=t_zong(6)+xin_bg_w(2)/numms;
    [xin_bg_w(3),xin_bg_w(4)]=min(Jbg_w(2:end));
    
    [xin_bg_w(5),xin_bg_w(6)]=max(Jbg_w(2:end));
    xin_bg_w(4)=xin_bg_w(4)+1;
    if best>xin_bg_w(3)
        best=xin_bg_w(3);best_index=xin_bg_w(4);best_chuang=6;
    end
    xin_bg_w(6)=xin_bg_w(6)+1;
    xin_bg_w(7)=xin_bg_w(5)-xin_bg_w(3);
    xlswrite(excelname,num2cell(xin_bg_w),'W_hun',excellocation)

    plot(num(2:end),Jbg_w(2:end),"-bs")
    legend("S_边","S_构","S_混","W_边","W_构","W_混")
%    legend("S_边际损失","S_构造式","S_混合","W_构造式","W_混合")
    xlabel("算法串长度")
    ylabel("目标函数代价值")
    drawnow
    hold off
    
    filename='C:\Users\15822\Desktop\与导师的交流\大三上\SWTA\确定性算法\';
    filename=strcat(filename,foldername);
    filename_zong=strcat(filename,"exact.mat");

    filename=strcat(filename,num2str(ii));
    if flag_best==0
        figurename=filename;
        figurename1=strcat(figurename,".jpg");
        print(ii,'-djpeg',figurename1)
    end
    filename_exact=strcat(filename,"exact");
    
    filename=strcat(filename,'.mat');
    filename_exact=strcat(filename_exact,".mat");
    %save(filename,"WAB","SAB","WN","SN","WAC","SAC","Jb_s","Jg_s","Jbg_s","Jg_w","Jbg_w","bian_s","bians_s","bian_w","bians_w","t","changes")

    
    %%效果表统计
    
    if excel_save==1
        xin_zong=zeros(1,44);
        xin_zong(1)=ii;
        xin_zong(2)=best;
        xin_zong(3)=best_index;
        xin_zong(4)=best_chuang;
        xin_zong(5)=(xin_b_s(4)-best)/best;
        xin_zong(6)=(xin_g_s(3)-best)/best;
        xin_zong(7)=(xin_bg_s(3)-best)/best;
        xin_zong(8)=(xin_b_w(4)-best)/best;
        xin_zong(9)=(xin_g_w(3)-best)/best;
        xin_zong(10)=(xin_bg_w(3)-best)/best;
        xin_zong(11)=(xin_b_s(3)-best)/best;
        xin_zong(12)=(xin_b_w(3)-best)/best;
        if xin_b_w(4)<=xin_b_s(4)
            xin_zong(13)=1;
        else
            xin_zong(13)=2;
        end
        if xin_b_w(11)==0 || xin_b_s(11)==0
            xin_zong(14)=0;
        else
            if xin_b_w(11)<=xin_b_s(11)
                xin_zong(14)=1;
            else
                xin_zong(14)=2;
            end
        end

        if xin_g_w(3)<=xin_g_s(3)
            xin_zong(15)=1;
        else
            xin_zong(15)=2;
        end
        if xin_g_w(10)==0 || xin_g_s(10)==0
            xin_zong(16)=0;
        else
            if xin_g_w(10)<=xin_g_s(10)
                xin_zong(16)=1;
            else
                xin_zong(16)=2;
            end
        end
        ce1=[xin_zong(6) xin_zong(9) xin_zong(11) xin_zong(12)];
        ce2=[xin_zong(6) xin_zong(9)];
        ce15=[xin_zong(6) xin_zong(9) xin_zong(11)];
        cew2=xin_zong(12);
        ce2b=[xin_zong(11) xin_zong(12)];
        ce2g=[(Jg_w(2)-best)/best (Jg_s(2)-best)/best];
        hun=[xin_zong(7) xin_zong(10)];
        xin_zong(41)=min(ce15);
        xin_zong_z(41)=xin_zong_z(41)+xin_zong(41)/numms;
        xin_zong(42)=min(cew2);
        xin_zong_z(42)=xin_zong_z(42)+xin_zong(42)/numms;
        xin_zong(43)=min(ce2b);
        xin_zong_z(43)=xin_zong_z(43)+xin_zong(43)/numms;
        xin_zong(44)=min(ce2g);
        xin_zong_z(44)=xin_zong_z(44)+xin_zong(44)/numms;
        xin_zong(17)=min(ce1);
        c1=min(ce1)
        xin_zong_z(17)=xin_zong_z(17)+xin_zong(17)/numms;
        if xin_zong(17)==0
            ce1n=ce1n+1;
        else
            xin_zong_z(37)=xin_zong_z(37)+xin_zong(17);
        end
        xin_zong(18)=min(ce2);
        c2=min(ce2)
        if xin_zong(18)==0
            ce2n=ce2n+1;
        else
            xin_zong_z(38)=xin_zong_z(38)+xin_zong(18);
        end
        xin_zong_z(18)=xin_zong_z(18)+xin_zong(18)/numms;
        xin_zong(19)=min(hun);
        if xin_zong(11)<=xin_zong(12)
            xin_zong(20)=1;
            xin_zong_z(20)=xin_zong_z(20)+1/numms;
        else
            xin_zong(20)=2;
        end
        if xin_zong(11)<=10^(-6)
            xin_zong(21)=1;
            xin_zong_z(21)=xin_zong_z(21)+1/numms;
        else 
            xin_zong(21)=0;
        end
        if xin_zong(12)<=10^(-6)
            xin_zong(22)=1;
            xin_zong_z(22)=xin_zong_z(22)+1/numms;
        else 
            xin_zong(22)=0;
        end
        xin_zong(23)=xin_b_w(9);
        xin_zong(24)=xin_b_s(9);
        xin_zong(25)=xin_b_w(10);
        xin_zong(26)=xin_b_s(10);
        if xin_b_w(9)==0
            bwn=bwn+1;
        else
            xin_zong_z(23)=xin_zong_z(23)+xin_zong(23);
            xin_zong_z(25)=xin_zong_z(25)+xin_zong(25);
        end
        if xin_b_s(9)==0
            bsn=bsn+1;
        else
            xin_zong_z(24)=xin_zong_z(24)+xin_zong(24);
            xin_zong_z(26)=xin_zong_z(26)+xin_zong(26);
        end
        xin_zong(27)=xin_g_w(8);
        xin_zong(28)=xin_g_s(8);
        xin_zong(29)=xin_g_w(9);
        xin_zong(30)=xin_g_s(9);
        if xin_g_w(8)==0
            gwn=gwn+1;
        else
            xin_zong_z(27)=xin_zong_z(27)+xin_zong(27);
            xin_zong_z(29)=xin_zong_z(29)+xin_zong(29);
        end
        if xin_g_s(8)==0
            gsn=gsn+1;
        else
            xin_zong_z(28)=xin_zong_z(28)+xin_zong(28);
            xin_zong_z(30)=xin_zong_z(30)+xin_zong(30);
        end
        xlswrite(excelname,num2cell(xin_zong),'J_zong',excellocation)
    end
    
    %%时间表统计
    if excel_save==1   
        xin_time=zeros(1,8);
        xin_time(1)=ii;
        xin_time(2)=sum(wtime)/wtimes;
        xin_time_z(2)=xin_time_z(2)+xin_time(2)/numms;
        xin_time(3)=sum(sgtime)/sgtimes;
        xin_time_z(3)=xin_time_z(3)+xin_time(3)/numms;
        xin_time(4)=sum(sbtime)/sbtimes;
        xin_time_z(4)=xin_time_z(4)+xin_time(4)/numms;
        xin_time(6)=xin_g_w(2)+xin_g_s(2);
        xin_time_z(6)=xin_time_z(6)+xin_time(6)/numms;
        xin_time(5)=2*(xin_time(2)+xin_time(4))+xin_time(6);
        xin_time_z(5)=xin_time_z(5)+xin_time(5)/numms;
        xin_time(8)=xin_bg_w(2)+xin_bg_s(2);
        xin_time_z(8)=xin_time_z(8)+xin_time(8)/numms;
        xin_time(7)=xin_time(8)+xin_time(6)+xin_b_s(2)+xin_b_w(2);
        xin_time_z(7)=xin_time_z(7)+xin_time(7)/numms;
        xlswrite(excelname,num2cell(xin_time),'time_zong',excellocation);
    end
    cez1=[xin_g_s(3) xin_g_w(3) xin_b_s(3) xin_b_w(3)];
    cez2=[xin_g_s(3) xin_g_w(3)];
    save(filename,"V","WAB","SAB","WN","SN","WAC","SAC","Jb_s","WM","Jg_s","Jbg_s","Jb_w","Jg_w","Jbg_w","bian_s","bians_s","bian_w","bians_w","PBkm_b_s","PCkL_b_s","PBkm_g_s","PCkL_g_s","PBkm_bg_s","PCkL_bg_s","PBkm_b_w","PCkL_b_w","PBkm_g_w","PCkL_g_w","PBkm_bg_w","PCkL_bg_w","cez1","cez2","best","Fw_g_w","Fw_b_w","Fw_g_s","Fw_b_s","Fs_g_w","Fs_b_w","Fs_g_s","Fs_b_s")

    if flag_best==1
        [tzong,numb,PAb,PBb,PCb,bestz]=exact(S,W,T,L,V,WAC,WAB,SAC,SAB,SN,WN,WM);
        bi_J_xu=(best-bestz)/bestz;
        bi_J_ce1=(min(cez1)-bestz)/bestz;
        bi_J_ce2=(min(cez2)-bestz)/bestz;
        Jzong=[Jb_s(2:end) Jb_w(2:end) Jbg_s(2:end) Jbg_w(2:end) Jg_s(2:end) Jg_w(2:end)];
        Jce2=[Jg_s(2:end) Jg_w(2:end)];
        Jce1=[Jce2 Jb_s(2) Jg_s(2)];
        numxu=length(unique(Jzong));
        numce1=length(unique(Jce1));
        numce2=length(unique(Jce2));
        bi_num_xu=numxu/numb;
        bi_num_ce1=numce1/numb;
        bi_num_ce2=numce2/numb;
        t_xu=xin_g_s(2)+xin_b_s(2)+xin_bg_s(2)+xin_g_w(2)+xin_b_w(2)+xin_bg_w(2);
        tzong
        t_ce1=xin_time(5);
        t_ce2=xin_time(6);
        bi_t_xu=t_xu/tzong;
        bi_t_ce1=t_ce1/tzong;
        bi_t_ce2=t_ce2/tzong;
        bi_best(1,ii)=bi_J_xu;bi_best(2,ii)=bi_J_ce1;bi_best(3,ii)=bi_J_ce2;
        bi_best(4,ii)=bi_t_xu;bi_best(5,ii)=bi_t_ce1;bi_best(6,ii)=bi_t_ce2;
        bi_best(7,ii)=bi_num_xu;bi_best(8,ii)=bi_num_ce1;bi_best(9,ii)=bi_num_ce2;
        bi_data(1,ii)=bestz;bi_data(2,ii)=best;bi_data(3,ii)=min(cez1);bi_data(4,ii)=min(cez2);
        bi_data(5,ii)=numb;bi_data(6,ii)=numxu;bi_data(7,ii)=numce1;bi_data(8,ii)=numce2;
        bi_data(9,ii)=tzong;bi_data(10,ii)=t_xu;bi_data(11,ii)=t_ce1;bi_data(12,ii)=t_ce2;
        save(filename_exact,"bi_J_xu","bi_J_ce1","bi_J_ce2","bi_num_xu","bi_num_ce1","bi_num_ce2","bi_t_xu","bi_t_ce1","bi_t_ce2","PAb","PBb","PCb")
    end
%     figure
%     plot(num(2:end),Jb_s(2:end),"-r+",num(2:end),Jg_s(2:end),"-ro",num(2:end),Jbg_s(2:end),"-rs",num(2:end),Jg_w(2:end),"-bo",num(2:end),Jbg_w(2:end),"-bs")
%     legend("S_边","S_构","S_混","W_构","W_混")
%     xlabel("算法串长度")
%     ylabel("目标函数代价值")
%     drawnow
%     figurename2=strcat(figurename,"_2.jpg");
%     print(2*ii,'-djpeg',figurename2)
    ii
    toc(t2)
 end
% filename_hui='C:\Users\15822\Desktop\与导师的交流\大三上\SWTA\确定性算法\';
% filename_hui=strcat(filename_hui,foldername);
% filename_hui=strcat(filename_hui,"zong.mat");
% save(filename_hui,"you","xu","t_zong");

if excel_save==1
   xin_zong_z(31)=(xin_zong_z(23)+xin_zong_z(24))/(2*numms-bwn-bsn);
   xin_zong_z(32)=(xin_zong_z(25)+xin_zong_z(26))/(2*numms-bwn-bsn);
   xin_zong_z(33)=(bwn+bsn)/2/numms;
   xin_zong_z(34)=(xin_zong_z(27)+xin_zong_z(28))/(2*numms-gwn-gsn);
   xin_zong_z(35)=(xin_zong_z(29)+xin_zong_z(30))/(2*numms-gwn-gsn);
   xin_zong_z(36)=(gwn+gsn)/2/numms;
   xin_zong_z(37)=xin_zong_z(37)/(numms-ce1n);
   xin_zong_z(38)=xin_zong_z(38)/(numms-ce2n);
   xin_zong_z(39)=ce1n/numms;
   xin_zong_z(40)=ce2n/numms;
   excellocation=strcat("A",num2str(numms+3));
   xlswrite(excelname,num2cell(xin_b_w_z),'W_bian',excellocation);
   xlswrite(excelname,num2cell(xin_b_s_z),'S_bian',excellocation);
   xlswrite(excelname,num2cell(xin_g_s_z),'S_gou',excellocation);
   xlswrite(excelname,num2cell(xin_g_w_z),'W_gou',excellocation);
   xlswrite(excelname,num2cell(xin_time_z),'time_zong',excellocation);
   xlswrite(excelname,num2cell(xin_zong_z),'J_zong',excellocation);
end
if flag_best==1
    bi_best=bi_best';
    bi_data=bi_data';
    save(filename_zong,"bi_best","bi_data");
end
load splat
sound(y,Fs)
toc(t3)
%%test_num_chong1
%%第二个值，最优值,最优值位置，最差值，最差值位置，变化幅度，稳定值最优值，稳定值最差值
%稳态值开始点,稳态值循环节数,时间开销(S),时间开销(w)
%xlsbiaotou={"第二个值","最优值","最优值位置","最差值","最差值位置","变化幅度","稳定值最优值","稳定值最差值","稳态值开始点","稳态值循环节数","时间开销(S)","时间开销(w)"};
end
