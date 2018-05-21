disk = 'G:';
month = '10';
ndays = 31;

com = fopen('comfile.txt','w');
for i=1:ndays
    if i<10
        day=strcat('0',int2str(i));
    else
        day=int2str(i);
    end
    str1  = strcat(disk,'/2015_',month,'/2015_',month,'_',day,'/');
    list = ls(strcat(str1,'*.hdf5'));
    
    szl = size(list);
    
    for i=1:szl(1)    
        qq = size(list(i,:));
        fprintf(com,'%s\r\n', strcat(str1,list(i,:)));    
    end
end

fclose(com);
    