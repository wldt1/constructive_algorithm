function [t,num,PA,PB,PC,bestz]=exact(S,W,T,L,V,WAC,WAB,SAC,SAB,SN,WN,WM)
    S=3;W=4;T=2;L=3;

    wn=zeros(1,T);
    wm=zeros(1,W);
    numw=0;
    Y1=zeros(1,W*L);
    Y=zeros(W,T,L);
    cunW.Y=0;
    cunW.PB=0;

    tic
    [wn,wm,numw,Y1,Y,cunW]=di_w(1,wn,wm,WN,WM,W,T,L,WAC,numw,Y1,Y,WAB,cunW);
    tw=toc;
    numw;

    sn=zeros(1,T);
    nums1=0;
    Z1=zeros(1,S);
    Z=zeros(S,T);
    cunS1.Z=0;
    cunS1.PA=0;

    tic
    [sn,nums1,Z1,Z,cunS1]=di_s(1,1,sn,SN,S,T,L,SAC,nums1,Z1,Z,SAB,cunS1);
    ts1=toc;

    sn=zeros(1,T);
    nums2=0;
    Z1=zeros(1,S);
    Z=zeros(S,T);
    cunS2.Z=0;
    cunS2.PA=0;

    tic
    [sn,nums2,Z1,Z,cunS2]=di_s(1,2,sn,SN,S,T,L,SAC,nums2,Z1,Z,SAB,cunS2);
    ts2=toc;

    sn=zeros(1,T);
    nums3=0;
    Z1=zeros(1,S);
    Z=zeros(S,T);
    cunS3.Z=0;
    cunS3.PA=0;

    tic
    [sn,nums3,Z1,Z,cunS3]=di_s(1,3,sn,SN,S,T,L,SAC,nums3,Z1,Z,SAB,cunS3);
    ts3=toc;
    %save("exact1.mat","cunW","cunS1","cunS2","cunS3","tw","ts1","ts2","ts3","numw","nums1","nums2","nums3");
    tic
    J=zeros(numw,nums1,nums2,nums3);
    for i=1:numw
        for ii=1:nums1
            for j=1:nums2
                for jj=1:nums3
                    PA=zeros(T,L);
                    PA(:,1)=cunS1(ii+1).PA;
                    PA(:,2)=cunS2(j+1).PA;
                    PA(:,3)=cunS3(jj+1).PA;
                    PC=zeros(T,L);
                    for l=1:L
                        PC(:,l)=prod(1-PA(:,1:l),2);
                    end
                    J(i,ii,j,jj)=V*prod(1-PC.*cunW(i+1).PB,2);
                end
            end
        end
        if mod(i,100)==0
            i;
        end
    end
    tj=toc;
    [bestz,index]=min(J,[],"all", 'linear' );
    [indexw,indexs1,indexs2,indexs3]=ind2sub([numw nums1 nums2 nums3],index);
    % indexw=floor((index-1)/(nums1*nums2*nums3))+1;
    % indexs1=floor(mod(index-1,nums1*nums2*nums3)/(nums2*nums3))+1;
    % indexs2=floor(mod(index-1,nums2*nums3)/nums3)+1;
    % indexs3=mod(index-1,nums3)+1;
    PA(:,1)=cunS1(indexs1+1).PA;
    PA(:,2)=cunS2(indexs2+1).PA;
    PA(:,3)=cunS3(indexs3+1).PA;
    PC=zeros(T,L);
    for l=1:L
        PC(:,l)=prod(1-PA(:,1:l),2);
    end
    PB=cunW(indexw+1).PB;
%     PA(:,1)=cunS1(4).PA;
%     PA(:,2)=cunS2(2).PA;
%     PA(:,3)=cunS3(3).PA;
%     PC2=zeros(T,L);
%     for l=1:L
%         PC2(:,l)=prod(1-PA(:,1:l),2);
%     end
%     PC1=PCkL_b_s(:,:,1);
%     PB1=PBkm_b_s(:,:,2);
%     J11=V*prod(1-PC1.*PB1,2);

%     J1=V*prod(1-PC.*cunW(indexw+1).PB,2);
%     J(index);
    %chaz=max(J,[],"all");
%    xiangyou=(best-bestz)/bestz;
    t=tw+ts1+ts2+ts3+tj;
    num=numw*nums1*nums2*nums3;
    %save("exact2.mat","cunW","cunS1","cunS2","cunS3","tw","ts1","ts2","ts3","numw","nums1","nums2","nums3","J","tj","bi");
end