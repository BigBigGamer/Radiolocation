% make .kml file 
function f = kml(LaKu, LoKu,str);
fid = fopen(strcat(str,'.kml'), 'wt');

fprintf(fid, '<?xml version="1.0" encoding="UTF-8"?>\r\n');
fprintf(fid, '<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">\r\n');
fprintf(fid,'<Document>\r\n');
fprintf(fid,'<name>ACTIVE LOG 003.kml</name>\r\n');
fprintf(fid,'<Style id="path3Style">\r\n');
        fprintf(fid,'<LineStyle>\r\n');
            fprintf(fid,'<color>ffffff00</color>\r\n');
            fprintf(fid,'<width>4</width>\r\n');
        fprintf(fid,'</LineStyle>\r\n');
    fprintf(fid,'</Style>\r\n');
    fprintf(fid,'<StyleMap id="path3Style0">\r\n');
        fprintf(fid,'<Pair>\r\n');
            fprintf(fid,'<key>normal</key>\r\n');
            fprintf(fid,'<styleUrl>#path3Style</styleUrl>\r\n');
        fprintf(fid,'</Pair>\r\n');
        fprintf(fid,'<Pair>\r\n');
            fprintf(fid,'<key>highlight</key>\r\n');
            fprintf(fid,'<styleUrl>#path3Style1</styleUrl>\r\n');
        fprintf(fid,'</Pair>\r\n');
    fprintf(fid,'</StyleMap>\r\n');
    fprintf(fid,'<Style id="path3Style1">\r\n');
        fprintf(fid,'<LineStyle>\r\n');
            fprintf(fid,'<color>ffffff00</color>\r\n');
            fprintf(fid,'<width>4</width>\r\n');
        fprintf(fid,'</LineStyle>\r\n');
    fprintf(fid,'</Style>\r\n');
    fprintf(fid,'<Placemark>\r\n');
        fprintf(fid,'<name>ACTIVE LOG 003</name>\r\n');
        fprintf(fid,'<styleUrl>#path3Style0</styleUrl>\r\n');
        fprintf(fid,'<MultiGeometry>\r\n');
            fprintf(fid,'<altitudeMode>absolute</altitudeMode>\r\n');
            fprintf(fid,'<LineString>\r\n');
                fprintf(fid,'<altitudeMode>absolute</altitudeMode>\r\n');
                fprintf(fid,'<coordinates>\r\n');
s = size(LaKu);                
for i = 1:s(1)
    for j = 1:s(2)        
        % each tenth
        if (j-10*floor(j*0.1))==0
            fprintf(fid, '%6.4f,%6.4f,0 ', LoKu(i,j),LaKu(i,j));
         end
    end
end


fprintf(fid,'</coordinates>\r\n');
fprintf(fid,' </LineString>\r\n');
fprintf(fid,'</MultiGeometry>\r\n');
fprintf(fid,' </Placemark>\r\n');
fprintf(fid,'</Document>\r\n');
fprintf(fid,'</kml>\r\n');

fclose(fid);
f=1;

