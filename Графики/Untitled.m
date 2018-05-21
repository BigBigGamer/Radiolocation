hold on
grid on
grid minor
xlabel('time, days');
ylabel('rcs, Db');
set(0,'defaultTextInterpreter','latex');
set(0,'DefaultAxesFontSize',12);
set(0,'DefaultTextFontSize',12);

LEAF=f_leaf_Ku.pp1;
LEAF1=f_leaf_Ku.pp2;
PINE=f_pine_Ku.pp1;
PINE1=f_pine_Ku.pp2;


VELD=f_veld_Ku.pp1;
VELD1=f_veld_Ku.pp2;
figure 

plot(LEAF.XData,LEAF.YData,'r')
hold on
grid on
grid minor
plot(LEAF1.XData,LEAF1.YData,'.r')
legend('leaf Ku fitted','leaf Ku dots')
xlabel('time, days');
ylabel('rcs, Db');
figure 
plot(PINE.XData,PINE.YData,'b')

hold on
grid on
grid minor
xlabel('time, days');
ylabel('rcs, Db');
plot(PINE1.XData,PINE1.YData,'.b')
legend('pine Ku fitted','pine Ku dots')
figure 
plot(VELD.XData,VELD.YData,'m')
hold on
grid on
grid minor
xlabel('time, days');
ylabel('rcs, Db');

plot(VELD1.XData,VELD1.YData,'.m')
legend('veld Ku fitted','veld Ku dots')
legend('leaf Ka fitted','pine Ka fitted','veld Ka fitted')