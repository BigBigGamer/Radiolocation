function [Out] = plotGraphs(data_set,area,FrRange,varargin)

NUM=zeros(height(data_set),1);
THETA=zeros(height(data_set),1);
RCDB=zeros(height(data_set),1);
DATE=datetime;
DATE(1)=[];

b=1;
    if isempty(varargin)
          for i=1:height(data_set)
               if strcmp(data_set{i,1},FrRange)

                            if strcmp(data_set{i,8},area) && (data_set{i,6}==0)
                                  NUM(b)=data_set{i,2};
                                  THETA(b)=data_set{i,3};
                                  RCDB(b)=data_set{i,5};
                                  DATE(b)=data_set{i,7};
                                  b=b+1;
                            end

               end
          end
          NUM=NUM(1:b-1);
          THETA=THETA(1:b-1);
          RCDB=RCDB(1:b-1);
          DATE=DATE';
         varname=strcat(strcat(area,'_'),FrRange);
              description=varname;
              eval(strcat(varname,'=table(NUM,THETA,RCDB,DATE);'));
              eval(strcat('Out=',varname));
              Out.Properties.Description=description;
              Out.Properties.VariableNames={'Num','Theta','Rc_Db','Date'};
    else
            for i=1:height(data_set)
               if strcmp(data_set{i,1},FrRange)

                            if strcmp(data_set{i,8},area) && (data_set{i,6}==0) && (abs(data_set{i,3})>=varargin{1}) && (abs(data_set{i,3})<=varargin{2})
                                  NUM(b)=data_set{i,2};
                                  THETA(b)=data_set{i,3};
                                  RCDB(b)=data_set{i,5};
                                  DATE(b)=data_set{i,7};
                                  b=b+1;
                            end

               end
            end
              NUM=NUM(1:b-1);
              THETA=THETA(1:b-1);
              RCDB=RCDB(1:b-1);
              DATE=DATE';
              varname=strcat(strcat(area,'_'),FrRange);
              description=varname;
              eval(strcat(varname,'=table(NUM,THETA,RCDB,DATE);'));
              eval(strcat('Out=',varname));
              Out.Properties.Description=description;
              Out.Properties.VariableNames={'Num','Theta','Rc_Db','Date'};
              
              
    end 
    
end

