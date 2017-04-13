function [Features, labels] = ExtractLables(filename,grader)
%Extracts features and Labels
% filename is name of file which is Flattened+Aligned(_FA.dcm)
% grader is grader.mat file for given volume
load(grader);
Tp_id = unique(grader1,'rows');
Tp_id = Tp_id(:,3);
Tp_id = unique(Tp_id);
dcmfile = dicominfo(filename);
frame = dicomread(dcmfile);
[x,y,m,z] = size(frame);

Features = zeros(z,59);
labels = zeros(1,z);
for iter = (1:z)
    clc;
    fprintf('%d%%',uint8(iter*100/z));
    feature = LBPFrame( frame(:,:,iter) );
    Features(iter,:) = feature;
    if find(Tp_id==iter)
        labels(iter) = 1;
    else
        labels(iter) = 0;
    end
end