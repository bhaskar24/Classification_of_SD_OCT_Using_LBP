function [] = NLMVolume(filename,debug,frames_from,frames_to,writeOnSamefile)
%example run('bscan_NLM.dcm',0,1,5,1);
a = dicominfo(filename);
y = dicomread(a);
[m,n,w,z] = size(y);

if(frames_to == 0)
    frames_from = 1;
    frames_to = z;
end

for frame=(frames_from:frames_to)
    clc;
    disp(frame);
    Img = y(:,:,frame);
    output = NLM(Img);
    if(debug== 1)
        figure,
        subplot(1,2,1),imshow(Img);
        subplot(1,2,2),imshow(output);
    end
    y(:,:,frame) = output;
end
%for changing filename from a.dcm to a_NLM.dcm
if writeOnSamefile ==0
    st = strsplit(filename,'.');
    str = strcat(st(1),'_NLM.');
    str = strcat(str,st(2));
else
    str = filename;
end
%writing file to above filename created
dicomwrite(y,char(str));
end