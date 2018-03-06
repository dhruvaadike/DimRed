clear param
fileList_scaled = getAllFiles('lfw_blurred');
fileList_scaled=char(fileList_scaled);
Nimages = length(fileList_scaled);
fid = fopen('names_scaled', 'w');;

for i = 1 : Nimages 
   x = fileList_scaled(i,:);
    fprintf(fid, '%s' , x);
    fprintf(fid,'\n');    
end
