clear; clc; close all;
% addpath(genpath('..\data'));
DT = { 'DATA_01_TYPE01', 'DATA_02_TYPE02', 'DATA_03_TYPE02', 'DATA_04_TYPE02', ...
    'DATA_05_TYPE02', 'DATA_06_TYPE02', 'DATA_07_TYPE02', 'DATA_08_TYPE02',...
    'DATA_09_TYPE02', 'DATA_10_TYPE02','DATA_11_TYPE02','DATA_12_TYPE02'};
DBPM  = { 'DATA_01_TYPE01_BPMtrace', 'DATA_02_TYPE02_BPMtrace', 'DATA_03_TYPE02_BPMtrace', 'DATA_04_TYPE02_BPMtrace', ...
    'DATA_05_TYPE02_BPMtrace', 'DATA_06_TYPE02_BPMtrace', 'DATA_07_TYPE02_BPMtrace', 'DATA_08_TYPE02_BPMtrace',...
    'DATA_09_TYPE02_BPMtrace', 'DATA_10_TYPE02_BPMtrace','DATA_11_TYPE02_BPMtrace','DATA_12_TYPE02_BPMtrace'};

%  for id=1:12
%     close all;
    load(DT{1});
    load(DBPM{1});
    Fs = 125;
    Result=zeros(125,1);
    Windsize = 8*Fs;
    step  = 2*Fs;
    numWind=floor((length(sig)-Windsize)/step+1);
    BPM = zeros(numWind,0);
    
    %bandpass filter
    W1=0.5/(Fs/2);% lovver cutoff
    W2=5/(Fs/2);%higher cutoff
    [b,a]=butter(2,[W1,W2]); % Bandpass digital filter design h = fvtool(b,a); % Visualize filter
    
    f1 = filtfilt(b,a,sig(2,:)); % applying filter
    f2 = filtfilt(b,a,sig(3,:));
    
    %bandpass filter
    
    %     x=(sig(2,:)+sig(3,:))/2;%average of two PPG signals
    x=(f1+f2)/2;
    %%filter for Motion Artifact Removal
    
    %%filter Filter for Motion Artifact Removal
    
    %Caluculation of Heart Rate(BPM)
    
    for j =1:numWind
        curSegment = (j-1)*step+1 : (j-1)*step+Windsize;
        y=fft((x(j:curSegment)-mean(x(j:curSegment))/1000));
        [maxpeak, maxpeakindes] = max(abs(y)*2);
        %  save(resultID{i},'BPM');
        BPM(j,1)=maxpeakindes*(Fs/1000);%*60;
       BPM=BPM(1:125);
    end
%     RES = { 'Result_S01_T01', 'Result_S02_T02', 'Result_S03_T02', 'Result_S04_T02', ...
%        'Result_S05_T02', 'Result_S06_T02', 'Result_S07_T01', 'Result_S08_T02',...
%        'Result_S09_T02', 'Result_S10_T01','Result_S11_T01','Result_S12_T01'}; 
%     save(RES{id},'BPM');
% end