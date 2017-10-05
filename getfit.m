function fit=getfit(x,y,frame,H,W,A)
[MY,MX]=size(frame);
x=int32(x);y=int32(y);
if(MY<y+H ||MX<x+W||x<=0||y<=0)
    fit=-100000000;
else
    tmpframe=frame(y:y+H,x:x+W);
    ot=double(reshape(tmpframe,[(H+1)*(W+1) 1]));
    RE=norm(ot-A*ot);
    %fit=exp(-RE);
    fit=-RE;
end
end
