function [Hist] = LBPFrame(img)
nFiltSize=8;
nFiltRadius=1;
filtR=generateRadialFilterLBP(nFiltSize, nFiltRadius);
effLBP= efficientLBP(img, 'filtR', filtR, 'isRotInv', true, 'isChanWiseRot', false);
U8File = importdata('UniformLBP8.txt');
BinNum = U8File(1, 1);
nDim = U8File(1, 2); %dimensionality of uniform patterns
Code = U8File(2 : end, :);
clear U8File;
Hist = zeros(1,59);
[x,y] = size(effLBP);
for i=1:x
    for j=1:y
        Hist(1,Code(effLBP(i,j)+1 , 2)+1 ) = Hist(1,Code( effLBP(i,j)+1 , 2)+1 )+1;
    end
end
end