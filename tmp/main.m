clear;clc;

video=VideoReader('~/test.mp4');

if(hasFrame(video))
    frame=readFrame(video);
    frame=imresize(frame,1.05,'bicubic');
    imshow(frame);
    rect=getrect;
    W=int32(rect(3));H=int32(rect(4));
    x=int32(rect(1));y=int32(rect(2));
    model=getmodel(frame(y:y+H,x:x+W,:));
else
    exit(-1);
end
while(hasFrame(video))
    frame=readFrame(video);frame=imresize(frame,1.05,'bicubic');
    [x,y,model]=pso(frame,H,W,model,x,y);
    imshow(frame);rectangle('Position',[x y W H],'edgeColor','r');hold off;
    pause(0.01);
end