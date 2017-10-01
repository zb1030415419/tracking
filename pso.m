function [bestx,besty]=pso(frame,H,W,model)
n=50;k=1000;
par=struct([]);
[MAXY,MAXX]=size(frame);MAXV=100;
for i=1:n
    par(i).x=rand()*(MAXX-W);
    par(i).y=rand()*(MAXY-H);
    par(i).vx=rand()*MAXV-MAXV/2;
    par(i).vy=rand()*MAXV-MAXV/2;
    par(i).fit=getfit(par(i).x,par(i).y,frame,H,W,model);
    par(i).bestx=par(i).x;
    par(i).besty=par(i).y;
end
gbest=par(1);
for t=1:k
    for i=1:n
        [par(i),gbest]=updatepar(par(i),gbest,frame,H,W,model);
    end
end
bestx=gbest.x;besty=gbest.y;
end