function model=getmodel(Image)
%model=imhist(Image,32);
model1=imhist(Image(:,:,1));
model2=imhist(Image(:,:,2));
model3=imhist(Image(:,:,3));
model=[model1' model2' model3']';
end