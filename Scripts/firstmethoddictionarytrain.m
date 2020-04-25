clc; clear all;

load KPCA_P(1.5)_TTest_1000T2000data.mat; %for training data
load weak_labels.mat;
mresutltvect3=lweak'; 

param.K=80;  % learns a dictionary with 100 elements
param.lambda=0.0005;
param.numThreads=4; % number of threads
param.batchsize=50;
ii=1;cellsize=50;
param.modeParam=0;
param.iter=100;
param.gamma1=0.005;
param.modeD=1;
newcdata1=[];

for j=1:200
    [indx1 indx2]=find(mresutltvect3==j);
   % data=weak1000(:,indx2);
    data=tedataw(:,indx2);
    data2=data1{:,:,j};
    data3=[data2 data];
    %newdata=[dict1{j,1} data];
    %trainnew{:,:,j}=newdata;
    trainnew{:,:,j}=data3;
    
end

tic;
for k=1:200

traindata=trainnew{:,:,k};
[DL2] = mexTrainDL(traindata,param);
newdict{k,:,:}=DL2;
end
toc;

% for L=1:200
%    
%     
%      data=newdict{L,1};
%       newcdata1=[newcdata1 data];
%         
% end
% 
%  save('FP(1.5)_KPCA1000TWT2000combine80(1g005).mat','newcdata1');
