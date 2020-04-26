clc;
clear all;
e=140;
param.K=7140;  % learns a dictionary with 100 elements
param.lambda=6;
param.numThreads=4; % number of threads
param.batchsize=200;
ii=1;cellsize=50;n1=5100;imvect1=[];
param.modeParam=0;
param.iter=100;
param.gamma1=6;
param.modeD=1;
labelretrieve=[]; labelretrieve1=[];labelretrieveA=[];labelretrieveA1=[];labelretrieveA2=[];labelretrieveA3=[];
%load waveletpacketdecom
mresutltvect1=[];mresutltvect22=[];mresutltvect3=[];mresutltvect4=[];mresutltvect5=[];mresutltvect6=[];
resi=[];matsi=[];perf=[];  confmat=[];
%load combinedalldictionaries200.mat;
% pc = parcluster('LocalProfile3');
% 
% pc.JobStorageLocation = '/home/matlabuser/Desktop/debaditya/HMDB51/Split1';
% 
% matlabpool(pc, 12); 

load combinedalldata140.mat;
  DD=data1;
               results=[];  
%load testmraseparatedwavelet.mat; p=2;
%load testdtiseparatedwavelet.mat; p=4;
%load testfmraseparatedwavelet.mat; p=3;
tic;
files = dir('/media/New Volume/adityactionrecogcodes/HMDB51/Split1/Test/*.mat'); 
for i = 1:51
           M= load(files(i).name); 
           %dict1{i,:,:} = mexTrainDL(M.now,param);
er=[];
        [s1 s2]= size(M.now2);
            imvect=M.now2;
            mresutltvect1=[];
        for j=1:s2
            
               M1=[];
                    
                 imvect1=imvect(:,j);
             % imvect1=normc(imvect1);
                alpha=mexLasso(imvect1,DD,param);
            
                   % R=mean(0.5*sum((imvect1-DD*alpha1).^2)+param.lambda*sum(abs(alpha1)));
                
               

                    alpha=abs(alpha);
                          for p=0:50  
                            a(p+1)=sum(alpha((e*p)+1:e*(p+1)),1);
                                                
                           end
                        %  M1=[a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 a34 a35 a36 a37 a38 a39 a40 a41 a42 a43 a44 a45 a46 a47 a48 a49 a50 a51];
                          [a1 b]=max(a);
                           mresutltvect1=[mresutltvect1 b];
                          
        end
        
          si= length(find(mresutltvect1==i))
         resi=[resi si];
         matsi=[matsi s2];
         per=si/s2;
         perf=[perf per];
        %       mresutltvect22{:,:,i}=mresutltvect1';    
end 
        totaltest=sum(matsi);
        totalresults=sum(resi);
        totalperformance=totalresults/totaltest
        toc;
            % fprintf('objective function1: %f\n',b);
                
       %   save('dict120results.mat','mresutltvect22');
           
      
        %{
        disp('vasu');
                    r1=a11+a21+a31+a41
                    r2=a12+a22+a32+a42
                    r3=a13+a23+a33+a43
                    r4=a14+a24+a34+a44
                    m2=[r1 r2 r3 r4];
                    [re re1]=max(m2);
                
                    disp('sreeenu');
        
         mresutltvect2=[mresutltvect2 mresutltvect1];
        %mresutltvect2=[mresutltvect2 re1];
        [M F Z]=mode(mresutltvect2);
              
         zvalue=[zvalue Z];
         
          if numel(zvalue{:})==2
              count=0;
                for l=1:4
                    if mresutltvect2(1,l)==p
                        count=count+1;
                    end
                end
               if count==2               
               M=p;
               end
          end
            
           
        mresutltvect3=[mresutltvect3 M];
%mresutltvect3=[mresutltvect3 re1];
           
     end
        save('mriresults1.mat','mresutltvect3');
        disp('mriresults strat');
                length(find(mresutltvect3==1))
                    length(find(mresutltvect3==2))
                        length(find(mresutltvect3==3))
                            length(find(mresutltvect3==4))
                            disp('mriresults end');
                            
labelretrieve=[]; labelretrieve1=[];labelretrieveA=[];labelretrieveA1=[];labelretrieveA2=[];labelretrieveA3=[];
%load waveletpacketdecom
mresutltvect1=[];mresutltvect2=[];mresutltvect3=[];mresutltvect4=[];mresutltvect5=[];mresutltvect6=[];

    
        end
        
        disp('vasu');
                    r1=a11+a21+a31+a41
                    r2=a12+a22+a32+a42
                    r3=a13+a23+a33+a43
                    r4=a14+a24+a34+a44
                    m2=[r1 r2 r3 r4];
                    [re re1]=max(m2);
                
                    disp('sreeenu');
        
        
         mresutltvect2=[mresutltvect2 mresutltvect1];
        %mresutltvect2=[mresutltvect2 re1];
        [M F Z]=mode(mresutltvect2);
              
         zvalue=[zvalue Z];
         
          if numel(zvalue{:})==2
              count=0;
                for l=1:4
                    if mresutltvect2(1,l)==p
                        count=count+1;
                    end
                end
               if count==2               
               M=p;
               end
          end
            
           
        mresutltvect3=[mresutltvect3 M];
%mresutltvect3=[mresutltvect3 re1];
           
     end
        save('mriresults3.mat','mresutltvect3');
        disp('dtiresults strat');
                length(find(mresutltvect3==1))
                    length(find(mresutltvect3==2))
                        length(find(mresutltvect3==3))
                            length(find(mresutltvect3==4))
                            disp('dtiresults end');

%}