function  [wn,wm,num,Y1,Y,cun]=di_w(wl,wn,wm,WN,WM,W,T,L,WAC,num,Y1,Y,WAB,cun)
    w=mod(wl-1,W)+1;
    l=floor((wl-1)/W)+1;
    if wl<=W*L
        if wm(w)<WM(w) 
            for t=1:T
                if WAC(w,t,l)==1 && wn(t)<WN(t)
                       wn(t)=wn(t)+1;
                       wm(w)=wm(w)+1;
                       wl=wl+1;
                       Y1(wl-1)=t;
                       Y(w,t,l)=1;
                       [wn,wm,num,Y1,Y,cun]=di_w(wl,wn,wm,WN,WM,W,T,L,WAC,num,Y1,Y,WAB,cun);
                       Y(w,t,l)=0;
                       Y1(wl-1)=0;
                       wn(t)=wn(t)-1;
                       wm(w)=wm(w)-1;
                       wl=wl-1;
                end
            end
        end

       
            wl=wl+1;
            [wn,wm,num,Y1,Y,cun]=di_w(wl,wn,wm,WN,WM,W,T,L,WAC,num,Y1,Y,WAB,cun);
            wl=wl-1;
    end
            if wl==W*L+1
                num=num+1;
                if mod(num,1000)==0
                    num
                end
                Z.Y=Y1;
                WAB=1-Y.*WAB;
                Z.PB=1-squeeze(prod(WAB,1));
                cun=[cun Z];
            end
end