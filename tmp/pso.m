function [bestx,besty,model]=pso(frame,H,W,model,bestx,besty)
n=20;k=200;
par=struct([]);
for i=1:n
    par(i).x=rand()*W+bestx;
    par(i).y=rand()*H+besty;
    par(i).vx=rand()*W*2-W;
    par(i).vy=rand()*H*2-H;
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
model=getmodel(frame(besty:besty+H,bestx:bestx+W,:)).*0.35+model.*0.65;
end
