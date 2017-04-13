function [] = modeVolume(filename,writeOnSamefile)
%will do Mode for denoising and oct_aligning also and flattening
a = dicominfo(filename);
y = dicomread(a);
[m,n,w,z] = size(y);

for frame=(1:z)
    disp(frame);
    Img = y(:,:,frame);
    Img = colfilt(Img, [3 3], 'sliding' ,@mode);
    Img = flatten(Img,0);
    y(:,:,frame) = Img;
end
if writeOnSamefile ==0
    st = strsplit(filename,'.');
    str = strcat(st(1),'_mode_FA.');
    str = strcat(str,st(2));
else
    str = filename;
end
%writing file to above filename created
dicomwrite(y,char(str));