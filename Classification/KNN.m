function [Model] = KNN(k)%generally k=5
%example: TrainedModel = KNN(5)
%newdataVector = [3,4,5,6];
%label = predict(newdataVector,TrainedModel); 
%will give label to new dataset
files = dir('*.mat');
Features = [];
[n,m] = size(files);
for i=1:n-1
    load(files(i).name);
    if i == 1
        Features = Histogram;
        Lab = Labels';
    else
        Features = vertcat(Features,Histogram);
        
        Lab = vertcat(Lab,Labels');
    end
end
Model = fitcknn(Features,Lab,'NumNeighbors',k,'Standardize',1);
end 