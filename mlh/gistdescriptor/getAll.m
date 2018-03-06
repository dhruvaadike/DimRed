clear param
fileList = getAllFiles('lfw');
fileList=char(fileList);
Nimages = length(fileList);
fid = fopen('names', 'w');;

for i = 1 : Nimages 
   x = fileList(i,:);
    fprintf(fid, '%s' , x);
    fprintf(fid,'\n');    
end
