clear;clc;

video=VideoReader('~/SAMPLE/tmp1.mov');

if(hasFrame(video))
    frame=readFrame(video);
    frame=rgb2gray(frame);
    imshow(frame);
    rect=getrect;
    W=int32(rect(3));H=int32(rect(4));
    x=int32(rect(1));y=int32(rect(2));
    model=reshape(frame(y:y+H,x:x+W)',[(H+1)*(W+1) 1]);
    [U,S,V]=svd(double(model),'econ');
    A=U*U';
else
    exit(-1);
end
while(hasFrame(video))
    frame=readFrame(video);frame=rgb2gray(frame);
    [x,y,A,model]=pso(frame,H,W,A,model,x,y);
    imshow(frame);hold on;plot(x,y,'g*');plot(x+W,y+H,'g*');hold off;
    pause(0.5);
end