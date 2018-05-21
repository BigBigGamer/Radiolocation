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
