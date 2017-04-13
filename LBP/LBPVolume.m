function [] = LBPVolume(dcmfile)
[Histogram,Labels] = ExtractLables(dcmfile,'grader.mat');

save 'Vol.mat' Histogram Labels ;
str = strsplit(dcmfile,'.');
str = strcat(str,'_LBP.mat');
str = str{1};
movefile('Vol.mat',str);
end