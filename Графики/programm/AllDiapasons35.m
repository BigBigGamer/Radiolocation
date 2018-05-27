%Сравнение всех графиков во всех диапазонах
hh=figure;
head

plot(V_Ku.XData,V_Ku.YData,'m')
plot(P_Ku.XData,P_Ku.YData,'b')
plot(L_Ku.XData,L_Ku.YData,'r')
saveas(hh,'Ku35.png');

hh=figure;
head

plot(V_Ka.XData,V_Ka.YData,'m')
plot(P_Ka.XData,P_Ka.YData,'b')
plot(L_Ka.XData,L_Ka.YData,'r')
saveas(hh,'Ka35.png');