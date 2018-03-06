% EXAMPLE 1
% Load image
clear all;
fileList = getAllFiles('lfw');
char x;
j=0;
gist = [];
name = [];
i=1;
while i <= length(fileList) 
    %%
    disp(i);
    x = fileList{i};
    [a,b] = strsplit(x,'.');
    if strcmp(a{2},'jpg')
        %%
        i = i+1;
        img1 = imread(x);

        % Parameters:
        clear param
        param.imageSize = [250 250]; % it works also with non-square images
        param.orientationsPerScale = [8 8 8 8];
        param.numberBlocks = 4;
        param.fc_prefilt = 4;

        % Computing gist requires 1) prefilter image, 2) filter image and collect
        % output energies
        [gisttemp, param] = LMgist(img1, '', param);
        [a,b]=strsplit(x,'\');
        
        gist = [gist;gisttemp];
    end
    if strcmp(a{2},'db')
        fileList(i,:)=[];
        
    end
end
