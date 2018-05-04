I=load('DATA_02_TYPE02.mat');
x=zeros(1,40000);
HR=zeros(200,1);
x=(I.sig(2,:)+I.sig(3,:))/2;
% m=zeros(1,146);
% h=zeros(1,146);
% % l=0;
% % disp(x(2));
%  z=zeros(1,37937); 
%  b=size(x);
% y=fft(x);
% % plot(y);
% for i =   1  :  146
%         curSegment = (i-1)*250+1 : (i-1)*250+1000;
%         y= fft(x(1:curSegment) - mean(x(1:curSegment)))/1000;
% [maxpeak, maxpeakindes] = max((y)*2);
% maxpeakindes
%  HR(i,1)=round(y(maxpeakindes));
% end;
% for i=2:1:b-1
% z(i)=abs(x(i+1)-x(i-1));
% end
%     for i =   1  :  146
%         curSegment = (i-1)*250+1 : (i-1)*250+1000;
%         s=0;
%         for j=1:1:curSegment
%         s=s+x(j);
%         end
%         m(i)=s/1000;
%     end
%   count=0;
%  for i =   1  :  146
%         curSegment = (i-1)*250+1 : (i-1)*250+1000;
% if(z(i)>2*m(i))
%      count = count+1 ; 
% end 
% HR(i,1)=round((125/60)*count);
% end

for i =1:146
         curSegment = (i-1)*250+1 : (i-1)*250+1000;
 y=fft((x(i:curSegment)-mean(x(i:curSegment))/1000));
 [maxpeak, maxpeakindes] = max(abs(y)*2);
 HR(i,1)=
end
 % plot(y);
% [pks,locs] = findpeaks(x(1:1000));
% for i =   1  :  146
%     curSegment = (i-1)*250+1 : (i-1)*250+1000;
% [pks,locs] = findpeaks(x(i:curSegment)
% end