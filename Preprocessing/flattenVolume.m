function [] = flattenVolume(bscanfile,debugflag,writeOnSamefile)
a = dicominfo(bscanfile);
y = dicomread(a);
[m,n,w,z] = size(y);

for i=(1:z)
    fprintf('%d_',i);
    I = flatten(y(:,:,i),debugflag);
    y(:,:,i) = I;
end

if writeOnSamefile ==0
    st = strsplit(bscanfile,'.');
    str = strcat(st(1),'_FA.');
    str = strcat(str,st(2));
else
    str = filename;
end
%writing file to above filename created
dicomwrite(y,char(str));
end