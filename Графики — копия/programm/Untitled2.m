hold on
grid on
grid minor
xlabel('$\theta$, degrees');
ylabel('rcs, Db');
set(0,'defaultTextInterpreter','latex');
set(0,'DefaultAxesFontSize',12);
set(0,'DefaultTextFontSize',12);
table=pine_Ku;
table_name=table.Properties.Description;
NumDate=datenum(table.Date);
% cftool(NumDate,table.Rc_Db);
plot(table.Theta,table.Rc_Db,'.b');
legend('')