clear param
fileList = getAllFiles('lfw_blurred');
fileList=char(fileList);
Nimages = length(fileList);
fid = fopen('names_scaled', 'w');;

for i = 1 : Nimages 
   x = fileList(i,:);
    fprintf(fid, '%s' , x);
    fprintf(fid,'\n');    
end
