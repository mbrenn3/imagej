clear
filename = 'results.txt';
delimiterIn = '\t';
headerlinesIn = 1;
A = importdata(filename,delimiterIn,headerlinesIn);
intensities = A.data(:, 3);
M = size(intensities,1)/24;
wells = reshape(intensities,M,24);
csvwrite('wells.csv',wells)
