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