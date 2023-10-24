function [PBkm,tw,F1,J]=deter_W(W,T,L,V,WAB,WAC,WN,WM,PCkL)
    tic
    WV=zeros(W,T,L);
    for i=1:L
         WV(:,:,i)=repmat(V,[W,1]);
    end    
    VQ=zeros(W,T,L);
    for i=1:W
        VQ(i,:,:)=squeeze(WAB(i,:,:)).*PCkL;
    end
    VQ=WV.*VQ.*WAC;

    N1=zeros(1,T);   %数目矩阵
    PBkm=ones(T,L);  
    F1=zeros(L,W);   %类算法中的z变量的排列
    while max(VQ(:))~=0
        [~,ind_max]=max(VQ(:));
        [im,jm,km]=ind2sub([W,T,L],ind_max);  
        F1(km,im)=jm;       
        VQ(:,jm,:)=VQ(:,jm,:)*(1-WAB(im,jm,km)*PCkL(jm,km));
        %约束处理
        VQ(im,:,km)=0;%一个武器在一个阶段只能打一个目标约束
        N1(jm)=N1(jm)+1;
        if N1(jm)>=WN(jm) %武器使用策略约束
            VQ(:,jm,:)=0;
        end
        WM(im)=WM(im)-1;%%武器弹药量约束
        if WM(im)<=0
            VQ(im,:,:)=0;
        end
        PBkm(jm,km)=PBkm(jm,km)*(1-WAB(im,jm,km));
    end
    PBkm=1-PBkm;
    J=V*prod(1-PCkL.*PBkm,2);
    tw=toc;
    F1=F1';
end