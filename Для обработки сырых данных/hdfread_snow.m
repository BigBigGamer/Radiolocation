% The program reads hdf5 files()
% makes .kml treck files (each 10th scan)

fid = fopen('place_coord.txt');
fidKu = fopen('areaKu.txt','wt');
fidKa = fopen('areaKa.txt','wt');

%fileinfo = hdf5info('GPMCOR_KUR_1408101628_1801_002552_1BS_DUB_02B.h5');
fn='GPMCOR_DPR_1507060004_0137_007676_L2S_DD2_03B.h5';
fileinfo = hdf5info(fn);
% for Ku-NS
% for Ku-NS
 LaKu = hdf5read(fileinfo.GroupHierarchy.Groups(3).Datasets(1));
 LoKu = hdf5read(fileinfo.GroupHierarchy.Groups(3).Datasets(2));
 sigmaKu = hdf5read(fileinfo.GroupHierarchy.Groups(3).Groups(9).Datasets(5));
 secofdayKu = hdf5read(fileinfo.GroupHierarchy.Groups(3).Groups(8).Datasets(8));
 preciprateKu = hdf5read(fileinfo.GroupHierarchy.Groups(3).Groups(6).Datasets(10));
 IncAngleKu = hdf5read(fileinfo.GroupHierarchy.Groups(3).Groups(5).Datasets(10));
 sizeKu = size(LaKu);
 %plot(IncAngleKu(:,10),sigmaKu(:,10),'r');
 hold on;
% for Ka-HS
 LaKa = hdf5read(fileinfo.GroupHierarchy.Groups(1).Datasets(1));
 LoKa = hdf5read(fileinfo.GroupHierarchy.Groups(1).Datasets(2));
 sigmaKa = hdf5read(fileinfo.GroupHierarchy.Groups(1).Groups(9).Datasets(5));
 secofdayKa = hdf5read(fileinfo.GroupHierarchy.Groups(1).Groups(8).Datasets(8));
 preciprateKa = hdf5read(fileinfo.GroupHierarchy.Groups(1).Groups(6).Datasets(10));
 IncAngleKa = hdf5read(fileinfo.GroupHierarchy.Groups(1).Groups(5).Datasets(10));
 sizeKa = size(LaKa);
 
fprintf(fidKu,'La        Lo        incAngle     Sigma0     Precipitation    Time'); 
k=1;

for i1 = 1:sizeKu(1)
  for j1 = 1:sizeKu(2)
        
     if (i1-floor(i1/10)*10)==0
         % La Lo inc Sigma0 Precipitation time
         LaKu1(k) = LaKu(i1,j1);
         LoKu1(k) = LoKu(i1,j1);
         k = k+1;
     end
     
  end
end

fclose(fidKu);

% make KML-file
f = kml(LaKu1,LoKu1,'Ku');