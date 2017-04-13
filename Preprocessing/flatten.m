function [I] = flatten(input,debugflag)
%debugflag=1 will give output in visible form.
%e.g. I = flatten(I1,0);
BW = im2bw(input,graythresh(input));
se = strel('disk',45);
BWclose = imclose(BW,se);
%imshowpair(BW,BWclose,'montage');
clear BW;
clc;
[m,n] = size(BWclose);
% m->height , n->width
%line vector will contain middle point of white pixels
line = zeros(1,n);
for i = 1:n
    j = 1;
    starting = m;
    ending = 1;
    while j<=m
        if BWclose(j,i) == 1
            starting = j;
            break;
        end
        j = j+1;
    end
    
    while j<=m
        if BWclose(j,i) == 0
            ending = j-1;
            break;
        end
        j = j+1;
    end
    line(i) = starting+((ending-starting)/2);
end

%polynomial regression
[m,xaxis] = size(line);
xaxis = (1:xaxis);
p = polyfit(xaxis,line,2);
pp = polyval(p,xaxis);

if debugflag == 1
    figure,
    plot(line);
    hold on
    plot(pp);
end
line = pp;

%line is now smoothened

line = uint64(line);
for i=1:n
    if(line(i)==0)
        line(i) = 1;
    end
    BWclose(line(i),i) = 0;
end
%Now for smoothening of line
%for i=2:(n-1)
%    line(i) = line(i-1)+((line(i)-line(i-1))/2);
%end
%Here line vector will be that line showing middle interpolated line.
if(debugflag==1)
    figure,
    imshowpair(input,BWclose,'montage');
end

%For getting lower most pixel
lowest = 1;
for i = 1:n
    if line(i)>lowest
        lowest = line(i);
    end
end

%For offset finding and shifting
I = input;
offset = zeros(1,n);
for i = 1:n
    offset(i) = lowest-line(i);
    I(:,i) = circshift(I(:,i),offset(i));
end

%For trimming and aligning
I = oct_align(I,debugflag);
end