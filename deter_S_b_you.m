function [PCkL,t_you,S3,J_you,t,S1,J,sum1]=deter_S_b_you(S,T,L,V,SAC,SAB,SN,PBkm)
    tic 
    S2=zeros(S,T,L);
    SAB=SAC.*SAB;
    SACb=SAC;%%用于找不充分解的可行性矩阵
 	PAkL=ones(T,L);
    for i=1:T
        for l=1:L
            PAkL(i,l)=prod(1-SAB(:,i,l),1); %%得到PAkL的减数矩阵（将武器维度合并）
        end
    end
    while sum(sum(sum(SAC,2)>1))>0 || (max(max(SN-sum(SAC)))>0)
        PCkL=ones(T,L);
        for l=1:L
                PCkL(:,l)=prod(1-PAkL(:,1:l),2);%%将阶段维度合并
        end
        PDKL=1-PCkL.*PBkm;
        J=V*prod(PDKL,2);
        delta=J*zeros(S,T,L);
        mindelta=inf;
        ds=0;di=0;dt=0;
        for s=1:S
            for i=1:T
                for l=1:L
                    if SAC(s,i,l)==1 && S2(s,i,l)==0
                        PA=PAkL;
                        PA(i,l)=PA(i,l)/(1-SAB(s,i,l));
                        PC=ones(T,L);
                        for ll=1:L
                            PC(:,ll)=prod(1-PA(:,1:ll),2);%%将阶段维度合并
                        end
                        PD=1-PC.*PBkm;
                        delta(s,i,l)=V*prod(PD,2)-J;
                        if delta(s,i,l)<=mindelta
                            ds=s;di=i;dl=l;mindelta=delta(s,i,l);
                        end
                    end
                end
            end
        end
        if ds==0 || S2(ds,di,dl)==1   %%此时说明找到重复解了
            break;
        end
        S2(ds,di,dl)=1;
        
        if sum(SAC(ds,:,dl))>1
            SAC(ds,di,dl)=0;
            PAkL(di,dl)=PAkL(di,dl)/(1-SAB(ds,di,dl));
        else
            if sum(SAC(:,di,dl))>SN(di)
               SAC(ds,di,dl)=0;
               PAkL(di,dl)=PAkL(di,dl)/(1-SAB(ds,di,dl));
            end
        end
    end
    S1=zeros(S,L);
    for l=1:L %%寻找仍可分配传感器
        N=ones(1,T);
        for i=1:T
            for s=1:S
                if SAC(s,i,l)==1
                    S1(s,l)=i;
                    SACb(s,:,l)=0;
                    N(i)=N(i)+1;
                    if N(i)>=SN(i)
                        SACb(:,i,l)=0;
                    end
                end
            end
        end               
    end
    S3=S1;
    J_you=J;
    t=toc;
    tic
    sum1=0;

    while max(max(max(SACb)))~=0
        delta_max=zeros(S,T,L);maxdelta=0;
        for s=1:S
            for i=1:T
                for l=1:L
                    if SACb(s,i,l)==1 
                        PA=PAkL;
                        PA(i,l)=PA(i,l)*(1-SAB(s,i,l));
                        PC=ones(T,L);
                        for ll=1:L
                            PC(:,ll)=prod(1-PA(:,1:ll),2);%%将阶段维度合并
                        end
                        PD=1-PC.*PBkm;
                        delta_max(s,i,l)=J_you-V*prod(PD,2);
                        if log10(delta_max(s,i,l))>log10(maxdelta)
                            ds=s;di=i;dl=l;maxdelta=delta_max(s,i,l);
                        end
                    end
                end
            end
        end
        if isinf(log10(maxdelta))
            break;
        end
        J_you=J_you-maxdelta;
        SACb(ds,:,dl)=0;
        N(di)=N(di)+1;
        if N(di)>=SN(di)
            SACb(:,di,dl)=0;
        end
        S3(ds,dl)=di;
        PAkL(di,dl)=PAkL(di,dl)*(1-SAB(ds,di,dl));
        sum1=sum1+1;
    end
    
    PCkL=ones(T,L);
    for l=1:L
            PCkL(:,l)=prod(1-PAkL(:,1:l),2);%%将阶段维度合并
    end
    
    S1=S1';
    S3=S3;
    t_you=toc;
    t_you=t+t_you;
end