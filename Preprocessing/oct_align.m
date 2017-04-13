function [BWtrimmed] = oct_align(input,debugflag)
% input should be readed matrix of image
%debugflag=1 for showing trimmed image
level = graythresh(input);
BW = im2bw(input,level);
se = strel('disk',45);
BWclose = imclose(BW,se);
I = double(input);
BWtrimmed = I.*BWclose;
BWtrimmed = uint16(BWtrimmed);
if debugflag==1
    figure,
    imshowpair(input,BWtrimmed,'montage');
end
end