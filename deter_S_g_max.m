function [PC,tgs,F2,Jg]=deter_S_g_max(S,T,L,V,SAC,SAB,SN,PBkm)
    tic
    Vy=V;
    Sy=ones(T,L); %%理想况下最优识别概率矩阵，不考虑约束条件
    for j=1:T
        for l=2:L
            Ss=SAB(:,j,l).*SAC(:,j,l);
            if SN(j)==1
                Sy(j,l)=max(Ss);
            else
                Ss=sort(Ss,"descend");
                for i=1:SN(j)
                    Sy(j,l)=Sy(j,l)*(1-Ss(i));
                end
                Sy(j,l)=1-Sy(j,l);
            end
        end
    end
    F2=zeros(S,L);%%类z排列
    for l=1:L
        J=zeros(S,T);VS=zeros(S,T,L);NS=zeros(1,T);
        %V=Vy;
        for j=1:T %%各个传感器的PCkL矩阵的构造
                %%武器与理想况下传感器的组合计算
                for ll=1:L-l    %%用此方法计算打击概率可以更高效些
                    l2=L+1-ll;
                    VS(:,j,l2)=VS(:,j,l2)+PBkm(j,l2);
                    VS(:,j,l2:L)=VS(:,j,l2:L)*Sy(j,l2);
                end
                VS(:,j,l)=VS(:,j,l)+PBkm(j,l);
                
                %%在此基础上增加
                VS(:,j,l:L)=VS(:,j,l:L).*SAB(:,j,l).*SAC(:,j,l);

                for ll=1:l-1
                    l2=l-ll;
                    VS(:,j,l2)=VS(:,j,l2)+PBkm(j,l2);
                    VS(:,j,l2:L)=VS(:,j,l2:L)*Sy(j,l2);
                end
                J(:,j)=(1-prod(1-VS(:,j,1:L),3))*V(j).*SAC(:,j,l);
        end
        Sys=ones(T,1);
        while 1
            [Jmax,ind_max]=max(J(:));
            if Jmax==0
                break;
            end
            [sd,jd]=ind2sub([S,T],ind_max);
            F2(sd,l)=jd;
            Sys(jd)=Sys(jd)*(1-SAB(sd,jd,l));
            J(sd,:)=0;%%第一个约束条件
            NS(jd)=NS(jd)+1;
            if NS(jd)>=SN(jd)%%第九个约束条件
                J(:,jd)=0;
            end
            J(:,jd)=J(:,jd)*(1-Jmax/V(jd));
            V(jd)=V(jd)*(1-Jmax/V(jd));
        end
        Sy(:,l)=1-Sys;
    end
    PC=Sy;
    for l=2:L
        PC(:,l)=prod(Sy(:,1:l),2);
    end
    V=Vy;
    Jg=V*prod(1-PC.*PBkm,2);
    tgs=toc;

end