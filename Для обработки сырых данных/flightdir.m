clear all
fidfile = fopen('areaKu.txt','r');
i = 1;

L1 = fgets(fidfile) ;
L1 = fgets(fidfile) ;      

while ~feof(fidfile)
    L1 = fgets(fidfile);     
    s = sscanf(L1,'%e %e %e %e %e %e');
    A(i,:) = s;
    i = i+1;
    L1 = fgets(fidfile);
end

dminla = 0.05;
dminlo = 0.02;
k = 1;
for i = 2:i-1
    dla = (A(i,1)-A(i-1,1));
    dlo = (A(i,2) - A(i-1,2));
    
    if abs(A(i,1)-A(i-1,1))<dminla && abs(A(i,2) - A(i-1,2))<dminlo
        angle(k,1) = 180/pi*atan(dlo / dla);
        k = k + 1;
    end  
    
end

Dir = mean(angle(:,1))
plot(A(:,1),A(:,2),'*')
hold on
plot(A(1,1),A(1,2),'r*');
hold on
plot(A(i,1),A(i,2),'k*');


