  from=0;
  to=30;
  [pine_Ka]=plotGraphs(alldata2,'pine','Ka',from,to);
  [pine_Ku]=plotGraphs(alldata2,'pine','Ku',from,to);
  [leaf_Ka]=plotGraphs(alldata2,'leaf','Ka',from,to);
  [leaf_Ku]=plotGraphs(alldata2,'leaf','Ku',from,to);
  [veld_Ka]=plotGraphs(alldata2,'veld','Ka',from,to);
  [veld_Ku]=plotGraphs(alldata2,'veld','Ku',from,to);
  

  
  subplot(3,2,1)
  plot(veld_Ku.Date,veld_Ku.Rc_Db,'*')
  subplot(3,2,2)
  plot(veld_Ka.Date,veld_Ka.Rc_Db,'*')
  subplot(3,2,3)
  plot(pine_Ku.Date,pine_Ku.Rc_Db,'*')
  subplot(3,2,4)
  plot(pine_Ka.Date,pine_Ka.Rc_Db,'*')
  subplot(3,2,5)
  plot(leaf_Ku.Date,leaf_Ku.Rc_Db,'*')
  subplot(3,2,6)
  plot(leaf_Ka.Date,leaf_Ka.Rc_Db,'*')