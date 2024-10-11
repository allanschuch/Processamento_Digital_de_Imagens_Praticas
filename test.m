pkg load image;
I = imread('images/lena_contraste.bmp');
i = im2bw(I);
a = [1,1,1;1,-1,1;1,1,1];
o = erosao(i,a);
O = imread(o);
