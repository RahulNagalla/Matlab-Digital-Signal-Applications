clc;
clear all;
close all;
I=load('DATA_01_TYPE01.mat');
load('DATA_01_TYPE01_BPMtrace.mat');
x=zeros(1,40000);
HR=zeros(200,1);
x=(I.sig(2,:)+I.sig(3,:))/2;

m=zeros(1,146);

 m=mean(x);
z=zeros(1,37937);

for i=2:1:37936
z(i)=abs(x(i+1)-x(i-1));
end

count=0;
for i = 1:1:37937
    if(z(i)>2*m)
     count = count+1 ; 
    end 
end 
HR=round((125/60)*count);