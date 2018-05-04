I=load('DATA_01_TYPE01.mat');
x=(I.sig(2,:)+I.sig(3,:))/2;
n=0;
for i=1:1:1000
    n=n+x(i);
end
round(n);
disp(n);