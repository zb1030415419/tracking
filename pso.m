function [bestx,besty,A,model]=pso(frame,H,W,A,model,bestx,besty)
n=20;k=5000;
par=struct([]);
[MAXY,MAXX]=size(frame);MAXV=10;
for i=1:n
    par(i).x=rand()*(MAXX/20)+bestx;
    par(i).y=rand()*(MAXY/20)+besty;
    par(i).vx=rand()*MAXV-MAXV/2;
    par(i).vy=rand()*MAXV-MAXV/2;
    par(i).fit=getfit(par(i).x,par(i).y,frame,H,W,A);
    par(i).bestx=par(i).x;
    par(i).besty=par(i).y;
end
gbest=par(1);
for t=1:k
    for i=1:n
        [par(i),gbest]=updatepar(par(i),gbest,frame,H,W,A);
    end
end
bestx=gbest.x;besty=gbest.y;
ot=reshape(frame(besty:besty+H,bestx:bestx+W),[(H+1)*(W+1),1]);
model=[model,double(ot)];
[U,S,V]=svd(double(model),'econ');
A=double(U*U');
end