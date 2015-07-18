clear
load i.csv
M = size(i,1)/24;
intensities = reshape(i,M,24);
csvwrite('intensities.csv',intensities)