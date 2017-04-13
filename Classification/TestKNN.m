%Test KNN classifier for cirrus folder
clear;
clc;
Mdl = KNN(1);
load bscan8_NLM_FA_LBP.mat;
newLables = predict(Mdl,Histogram);
valueMatch = 0;
[n,m] = size(Labels);
%n--> number of test cases
for i=1:n
    if Labels(i) == newLables(i)
        valueMatch = valueMatch + 1;
    end
end
ans = Labels - newLables;
fprintf('Incorrect Values=%d\n',sum(ans));
