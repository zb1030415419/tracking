function fit=getfit(x,y,frame,H,W,model)
[MY,MX,MZ]=size(frame);
x=int32(x);y=int32(y);
if(MY<y+H ||MX<x+W||x<=0||y<=0)
    fit=-100000000;
else
    tmpframe=frame(y:y+H,x:x+W,:);
    tmp=getmodel(tmpframe);
    fit=-1*acos(model'*tmp/(norm(tmp)*norm(model)));
end
end
