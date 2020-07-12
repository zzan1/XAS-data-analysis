function staticArray = getStatics(fileName)
    %GETSTATICS: Fetch 2nd column data from the origin txt
    %fileName: file path
    delimiterIn = ' ';

    data = importdata(fileName, delimiterIn);
    staticArray = data(:, 2);
end
