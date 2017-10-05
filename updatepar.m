function [par,gbest,A]=updatepar(par,gbest,frame,H,W,A)
par.x=par.x+par.vx;
par.y=par.y+par.vy;
fit=getfit(par.x,par.y,frame,H,W,A);

c1=1;c2=1;

par.vx=par.vx+c1*rand()*(gbest.x-par.x)+c2*rand()*(par.bestx-par.x);
par.vy=par.vy+c1*rand()*(gbest.y-par.y)+c2*rand()*(par.besty-par.y);
if(fit>par.fit)
    par.fit=fit;
    par.bestx=par.x;
    par.besty=par.y;
end
if(fit>gbest.fit)
    gbest=par;
end