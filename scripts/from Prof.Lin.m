%% open Fe soleil data Dec.fast detector
clear all;
close all;
%% average  I0 or dark data
pathname ='E:\Lin\Research_Project\solei beamtime\2018-12\2mM-FeSO4-NiSO4-20181207\Dark_I0__2\dark-reaction2_f000000000000_129_ascii';

fileList = dir(pathname)
fileList = fileList(~[fileList.isdir]); %remove directories
xlsfiles={fileList.name};
[~,idx]=natsortfiles(xlsfiles); %list is now in ascending name orde
fileList=fileList(idx);
numfiles = numel(fileList);

i=1
filename = strcat(pathname,'\',fileList(i).name); 
delimiter = ' ';
formatSpec = '%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'EmptyValue', NaN,  'ReturnOnError', false);
fclose(fileID);
tempdata = table(dataArray{1:end-1}, 'VariableNames', {'Index','D011CX1DTDTCaverageAbsorption'});
tempdata1= table2array(tempdata);

for i = 2:numfiles ;
%open files

filename = strcat(pathname,'\',fileList(i).name); 
delimiter = ' ';
formatSpec = '%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'EmptyValue', NaN,  'ReturnOnError', false);
fclose(fileID);
tempdata = table(dataArray{1:end-1}, 'VariableNames', {'Index','D011CX1DTDTCaverageAbsorption'});
tempdata= table2array(tempdata);
tempdatay=tempdata(:,2);
tempdata1=[tempdata1,tempdatay];
end

clearvars filename delimiter formatSpec fileID dataArray ans;
A=tempdata1(:,2:end);
aver=mean(A,2);
dark=[tempdata1(:,1) aver]

%%
clear all;
close all;
%%
%load   I0  and dark
load('I0_reaction2.mat');
I0data = I0_dark_2_I0_reaction2;
darkdata = dark_reaction2;

%load I1 data ascii and convert to abs
pathname = 'C:\Users\linli826\Desktop\New folder (2)\450_550mv\I-reaction91_f000000000000_98_ascii';

fileList = dir(pathname)
fileList = fileList(~[fileList.isdir]); %remove directories
% [junk, sortorder] = sort([fileList.datenum]);
% fileList = fileList(sortorder); %list is now in ascending date order
xlsfiles={fileList.name};
[~,idx]=natsortfiles(xlsfiles); %list is now in ascending name orde
fileList=fileList(idx);

numfiles = numel(fileList);
i_0=1;
%%
for i = 14000:14005;
%     i = i_0:numfiles;
filename = strcat(pathname,'\',fileList(i).name); 
delimiter = ' ';
formatSpec = '%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'EmptyValue', NaN,  'ReturnOnError', false);
fclose(fileID);

tempdata = table(dataArray{1:end-1}, 'VariableNames', {'Index','D011CX1DTDTCaverageAbsorption'});
tempdata1= table2array(tempdata);
x_axis=tempdata1(:,1);

%CalXAS=log((I0-dark)/(I1-dark));
I0=I0data(:,2);
dark=darkdata(:,2);
tempdata1y=tempdata1(:,2);
A=I0-dark;
B=tempdata1y-dark;
C=A./B;
XAS1= log10(C);
XAS1=real(XAS1);
tempdatasum(:,i-i_0+1) = XAS1;
tempdataavg1=mean(tempdatasum,2) ;
clearvars filename delimiter formatSpec fileID dataArray ans tempdata i name fname I0 A B C XAS1;
end


%%%% plot average data
figure;hold on;
avg_XAS=[x_axis,tempdataavg1];
plot(avg_XAS(:,1),avg_XAS(:,2));
deglitch=medfilt1(tempdataavg1,3);
plot(x_axis,deglitch);
%% plot

data1=avg_XAS_98_nr1000_1005
data2=avg_XAS_98_nr2000_2005
data3=avg_XAS_98_nr14000_14005
figure;
hold on;
 plot(data1(:,1),data1(:,2),'LineWidth', 2);
 plot(data2(:,1),data2(:,2),'LineWidth', 2);
 plot(data3(:,1),data3(:,2),'LineWidth', 2);
 legend('data1','data2','data3');
   
% xlim([400 700]);
% ylim([0 0.15]);
