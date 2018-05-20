function [Out] = plotGraphs(data_set,area,FrRange,varargin)
% [Out]=plotGraphs(data_set,area,FrRange),where data_set is a N by 8 table
%   of information taken from excel file,area is location,which is desired
%   to get(leaf,pine, or veld), FrRange isfreaquency range (Ku or Ka). The
%   output is a M by 4 table of data of needed area and freaquency range,
%   formatted as follows: Point Number, Theta, Rc_Db, Date.
%  [Out]=plotGraphs(data_set,area,FrRange,from,to) gives similar output, but
%   only those rows, which theta's value is between from and too values.
%   The algorithm sorts out rows, where rain value is not 0.
NUM=zeros(height(data_set),1);
THETA=zeros(height(data_set),1);
RCDB=zeros(height(data_set),1);
DATE=datetime;
DATE(1)=[];

b=1;
    if isempty(varargin) %if theres no angle range input, then do for all angles
          for i=1:height(data_set)
               if strcmp(data_set{i,1},FrRange)

                            if strcmp(data_set{i,8},area) && (data_set{i,6}==0)
                                  NUM(b)=data_set{i,2};     %create vector of numbers
                                  THETA(b)=data_set{i,3};   %create vector of angles
                                  RCDB(b)=data_set{i,5};    %create vector of values
                                  DATE(b)=data_set{i,7};    %create vector of dates
                                  b=b+1;                    %counter
                            end

               end
          end
          %cut the empty parts
          NUM=NUM(1:b-1);
          THETA=THETA(1:b-1);
          RCDB=RCDB(1:b-1);
          DATE=DATE';
          %create string, according to
         varname=strcat(strcat(area,'_'),FrRange);
              Out=table(NUM,THETA,RCDB,DATE);
              Out.Properties.Description=varname;
              Out.Properties.VariableNames={'Num','Theta','Rc_Db','Date'};
    else %if there is angle range input, then do for given angles
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
              Out=table(NUM,THETA,RCDB,DATE);
              Out.Properties.Description=varname;
              Out.Properties.VariableNames={'Num','Theta','Rc_Db','Date'};
              
              
    end 
    
end

