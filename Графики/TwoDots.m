hh=figure;
head
N1R=alldata11S3.rcs_db
N1D=alldata11S3.data
N2R=alldata11S1.rcs_db
N2D=alldata11S1.data
saveas(hh,'n1.png')
plot(N1D,N1R,'*r');
hh=figure;
head
plot(N2D,N2R,'b*');
saveas(hh,'n2.png')