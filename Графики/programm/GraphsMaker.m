function [f]=GraphsMaker(TABLE,table)
% str_hh=strcat(table_name,'.fittedmodel');

% TABLE=eval(strcat(table_name,'_struct.fittedmodel'));
hh=plot(TABLE);
h=get(hh);
x=h.XData;
y=h.YData;
formatout='dd/mm/yyyy';
x=datestr(x,formatout);
LdateN_1=datetime(x);


pp1=plot(LdateN_1,y); 

hold on
grid on
grid minor
xx=table.Date;
yy=table.Rc_Db;

pp2=plot(xx,yy,'.');

xlabel('time, days');
ylabel('rcs, Db');

% struct_name=strcat('fitted_',table_name);
f=[struct('pp1',pp1,'pp2',pp2)];

 end