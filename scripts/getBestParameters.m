% File must be opened with MATLAB, and executed with the program inside the
% directory \\wsl$\Ubuntu-20.04\home\user\PAV\P2\scripts

clear all
close all
clc

alfa0 = 0;
alfa1 = 0;
alfa2 = 0;
result = 0;

maxAlfa0 = 0;
maxAlfa1 = 0;
maxAlfa2 = 0;
maxResult = 0;

data = fopen('../results.txt', 'r');
while (~feof(data))
    parameters = fscanf(data, '%f %f %f\n');
    alfa0 = parameters(1);
    alfa1 = parameters(2);
    alfa2 = parameters(3);
    results = fscanf(data, '===> TOTAL: %f%c\n\n');
    result = results(1);
    if (result > maxResult)
        maxResult = result;
        maxAlfa0 = alfa0;
        maxAlfa1 = alfa1;
        maxAlfa2 = alfa2;
    end
end

fclose(data);

maxAlfa0
maxAlfa1
maxAlfa2
maxResult

% RECORDS
%  4.75         -       -       => 88.931%
%   -        0.0006     -       => 87.099%
%   -           -     -350      => 40.651%
%  4.75      0.0006   -350      => 80.928%
%  4.75      0.0006     -       => 90.094%
%   6        0.00045    -       => 90.465%
%   8        0.0004     -       => 90.815%
%   10       0.0002     -       => 91.318%
%   9.25     0.0002     -       => 92.106% (FRAME_TIME = 40ms)

% FROM THIS POINT: ALFA2 = FTIME
%   9.50      0.0002500    50      => 92.688% 
%   9.00      0.0003000    80      => 93.115% 
%   8.75      0.0003750    80      => 93.266% 
%   8.60      0.0003950    84      => 93.294% 
