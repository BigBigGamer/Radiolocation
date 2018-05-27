hh=figure;
head
N1R=alldata1S5.rcs_db;
N1D=alldata1S5.date;
N2R=alldata1S6.rcs_db;
N2D=alldata1S6.date;
N3R=alldata1S7.rcs_db;
N3D=alldata1S7.date;
N4R=alldata1S3.rcs_db;
N4D=alldata1S3.data;

plot(N1D,N1R,'*r');
legend('n=3 Ku leaf')
saveas(hh,'n1_Ku_leaf.png')

hh=figure;
head
plot(N2D,N2R,'b*');
legend('n=3 Ku pine')
saveas(hh,'n2_Ku_pine.png')

hh=figure;
head
plot(N3D,N3R,'g*');
legend('n=5 Ku pine')
saveas(hh,'n3_Ku_pine.png')

hh=figure;
head
plot(N3D,N3R,'m*');
legend('n=2 Ku leaf')
saveas(hh,'n4_Ku_leaf.png')