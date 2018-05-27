hh=figure;
head

% plot(P_Ku.XData,V_Ku.YData,'m')
plot(P1_Ku.XData,P1_Ku.YData,'.b')
plot(P1_Ka.XData,P1_Ka.YData,'r.')
legend('pine Ku','pine Ka')

saveas(hh,'pine_Ku_Ka.png');

% hh=figure;
% head
% 
% plot(P_Ka.XData,P_Ka.YData,'m')
% plot(P1_Ka.XData,P1_Ka.YData,'m.')
% saveas(hh,'pine_Ka.png');

% hh=figure;
% head
% xlabel('$\theta$, degrees');
% ylabel('rcs, Db');
% table=pine_Ku;
% table_name=table.Properties.Description;
% NumDate=datenum(table.Date);
% % cftool(NumDate,table.Rc_Db);
% plot(table.Theta,table.Rc_Db,'.b');
% legend('pine Ku');
% saveas(hh,'pine_Ku_Theta.png');