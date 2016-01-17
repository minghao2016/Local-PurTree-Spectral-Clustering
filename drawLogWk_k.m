%test computeLogWk
%input 5 csv files
%
%%
clc;
%clear all;

folder_now = pwd;
addpath([folder_now,'\real_data']);
addpath([folder_now, '\functions']);
addpath([folder_now, '\draw']);


level=5;

for i=1:level
    num=csvread([ 'l' num2str(i) '.csv']);
    D(:,:,i)=num;
end
sprintf('The number of objects is: %d', size(D,1))

start=5;
ed=100;
k=start:5:ed;
c=20:5:50;
eta=0.8;
lw=zeros(length(c),length(k));
nc=zeros(length(c),length(k));
for i=1:length(c)
    for j=1:length(k)
        [y, ~, ~, distX, ~]=LPT(D,c(i),k(j),eta);
        lw(i,j)=logWK(distX,y);
        nc(i,j)=length(unique(y));
    end
end

figure('name','No. of recovered clusters'); 
plot(k,nc,'b-*')
xlabel('No. of neighbors')
ylabel('No. of clusters')

figure('name','Log(Wk)'); 
plot(k,lw,'b-*')
xlabel('No. of neighbors')
ylabel('Log(Wk)')





%%