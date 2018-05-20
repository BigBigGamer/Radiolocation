figure
title('3-5 degrees')
hold on
grid on
grid minor
xlabel('time, days');
ylabel('rcs, Db');
set(0,'defaultTextInterpreter','latex');
set(0,'DefaultAxesFontSize',12);
set(0,'DefaultTextFontSize',12);

LEAF=f_leaf_Ka.pp1;
LEAF1=f_leaf_Ka.pp2;

PINE=f_pine_Ka.pp1;
PINE1=f_pine_Ka.pp2;

VELD=f_veld_Ka.pp1;
VELD1=f_veld_Ka.pp2;

plot(LEAF.XData,LEAF.YData,'r')
plot(PINE.XData,PINE.YData,'b')
plot(VELD.XData,VELD.YData,'m')
% plot(LEAF1.XData,LEAF1.YData,'.r')
% plot(PINE1.XData,PINE1.YData,'.b')
legend('leaf Ka fitted','pine Ka fitted','veld Ka fitted')