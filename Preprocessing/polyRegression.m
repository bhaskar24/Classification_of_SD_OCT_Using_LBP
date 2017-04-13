xaxis = (1:512);
p = polyfit(xaxis,line,2);
pp = polyval(p,xaxis);