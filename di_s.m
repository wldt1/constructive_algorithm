function  [sn,num,Z1,Z,cun]=di_s(s,l,sn,SN,S,T,L,SAC,num,Z1,Z,SAB,cun)
    if s<=S
        for t=1:T
            if SAC(s,t,l)==1 && sn(t)<SN(t)
                   sn(t)=sn(t)+1;
                   s=s+1;
                   Z1(s-1)=t;
                   Z(s-1,t)=1;
                   [sn,num,Z1,Z,cun]=di_s(s,l,sn,SN,S,T,L,SAC,num,Z1,Z,SAB,cun);
                   Z(s-1,t)=0;
                   Z1(s-1)=0;
                   sn(t)=sn(t)-1;
                   s=s-1;
            end
        end   
            s=s+1;
            [sn,num,Z1,Z,cun]=di_s(s,l,sn,SN,S,T,L,SAC,num,Z1,Z,SAB,cun);
            s=s-1;
    end
            if s==S+1 
                num=num+1;
                if mod(num,1000)==0
                    num
                end
                Z2.Z=Z1;

                SAB=1-Z.*squeeze(SAB(:,:,l));
                Z2.PA=squeeze(prod(SAB,1));
                cun=[cun Z2];
            end
end