
    
    test_file_a

    %clear all
fid = fopen('place_coord.txt');
while ~feof(fid)    
    L = fgets(fid);
    L = fgets(fid);
    La0 = sscanf(L,'%e');
    L = fgets(fid);
    L = fgets(fid);
    Lo0 = sscanf(L,'%e');
    L = fgets(fid);
    L = fgets(fid);
    R = km2deg(sscanf(L,'%e'));    
end
%Create Latitude search area:
LaMax=La0+R;
LaMin=La0-R;
%Create Longitude search area with respect to borders:
if Lo0+2*R>180
    LoMin=Lo0-2*R;
    LoMax=180;
    LoMaxJump=-180+(Lo0+2*R-180);
    LoMinJump=-180;

elseif Lo0-2*R<-180
    LoMin=-180;
    LoMax=Lo0+2*R;
    LoMaxJump=180;
    LoMinJump=180+(Lo0-2*R+180);
    
else
    LoMin=Lo0-2*R;
    LoMax=Lo0+2*R;
    LoMaxJump=0;
    LoMinJump=0;
end

fclose(fid);
day='01';
%Counter of days done
numberOfDays=0;
fdone=0;
  
    cmfile='comfile.txt';
fid = fopen(cmfile);
while ~feof(fid)
    folderStatus=0;
    folderMessage='';
    L = fgets(fid);
    whatK=strcat(L(30),L(31));
    year = strcat(L(47),L(48));
    month = strcat(L(49),L(50));
    p_day=day;
    day = strcat(L(51),L(52));
    orbit = strcat(L(63),L(64),L(65),L(66),L(67),L(68));
       
        %Counter of days done
        if ~strcmp(p_day,day)
            numberOfDays=numberOfDays+1;
           displayText=strcat('Days done: ',num2str(numberOfDays));
           disp(displayText) 
        end
        
    fn = sscanf(L,'%s');
    dirn = strcat('d',day,'m',month,'y',year,'T',orbit);
     tic; 
    fileinfo = hdf5info(fn);
    %Reading info from HDF5 file    
     LaK = hdf5read(fileinfo.GroupHierarchy.Groups(1).Datasets(1));
     LoK = hdf5read(fileinfo.GroupHierarchy.Groups(1).Datasets(2));
      readingTime=toc;
     sigmaK = hdf5read(fileinfo.GroupHierarchy.Groups(1).Groups(9).Datasets(5));
     secofdayK = hdf5read(fileinfo.GroupHierarchy.Groups(1).Groups(8).Datasets(8));
     preciprateK = hdf5read(fileinfo.GroupHierarchy.Groups(1).Groups(6).Datasets(10));
     IncAngleK = hdf5read(fileinfo.GroupHierarchy.Groups(1).Groups(5).Datasets(10));
    
     sizeK = size(LaK);
   %Preallocating    
    LaK_New=zeros(1,sizeK(1)*sizeK(2));
    LoK_New=zeros(1,sizeK(1)*sizeK(2));
    firstTime=true;
    k = 1;
    tic;
    for i = 1:sizeK(1)
      for j = 1:sizeK(2)
          if LaK(i,j) <= LaMax && LaK(i,j) >= LaMin
              if or(LoK(i,j)<=LoMax && LoK(i,j)>=LoMin,LoK(i,j)<=LoMaxJump && LoK(i,j)>=LoMinJump) 
                 dist = distance(LaK(i,j),LoK(i,j),La0,Lo0);        
                 if dist <= R
                     %creating folder, only if needed
                      if firstTime
                        [folderStatus,folderMessage]=mkdir(dirn);%making directory with 'dirn' name
                        fidK = fopen(strcat(dirn,strcat('\area',whatK,'.txt')),'wt');
                        fprintf(fidK,'%12s   %12s   %12s   %12s   %12s   %12s\r\n','La','Lo','incAngle','Sigma0','Precipitation','Time');
                        firstTime=false;
                      end
                     % La Lo inc Sigma0 Precipitation time
                     fprintf(fidK,'%e   %e   %e   %e   %e   %e   \r\n',LaK(i,j),LoK(i,j),IncAngleK(i,j),sigmaK(i,j),preciprateK(i,j),secofdayK(j,1));
                     LaK_New(k) = LaK(i,j);
                     LoK_New(k) = LoK(i,j);
                     k = k+1;
                 end
             end
          end
      end
    end
    LaK_New(k:end)=[];
    LoK_New(k:end)=[];
    if ~firstTime
        fclose(fidK);
    end
  processingTime=toc; 
    
% if Ka area contains any points, we go to Ku and also make kml-files with
% areas around buoy

    if k > 1
        f = kml1(LaK_New,LoK_New,whatK,dirn);
    end
    
   
% if Ka area does not have points make kml files with all track to look if
% any others buoys are containes there
%     if kKa == 1
%         f = kml2d(LaKa, LoKa, strcat('Ka',fn));
%     end
fdone=fdone+1;
disp(strcat('Files done: ',num2str(fdone),' ReadingTime=',num2str(readingTime),' ProcessingTime=',num2str(processingTime)))
end % end comfile 
disp('Done!');
