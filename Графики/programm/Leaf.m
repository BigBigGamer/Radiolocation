hh=figure;
head
xlabel('$\theta$, degrees');
ylabel('rcs, Db');
table=leaf_Ku;
% table_name=table.Properties.Description;
% NumDate=datenum(table.Date);
% cftool(NumDate,table.Rc_Db);
plot(table.Theta,table.Rc_Db,'.r');
legend('leaf Ku');
saveas(hh,'leaf_Ku_Theta.png');

hh=figure;
head
xlabel('$\theta$, degrees');
ylabel('rcs, Db');
table=leaf_Ka;
% table_name=table.Properties.Description;
% NumDate=datenum(table.Date);
% cftool(NumDate,table.Rc_Db);
plot(table.Theta,table.Rc_Db,'.r');
legend('leaf Ka');
saveas(hh,'leaf_Ka_Theta.png');



