function resultArray = calXASMean(PATH, prefix, suffix, I0_Array, dark_Array)
    %CALCULATEMEAN import all statics within a dir and calculate their mean

    % For FeO, Fe2O3, FeFoil. they don't have several times repeat measurements. 
    % they only have 15000 times different time measurements.

    % FileName rule, can be changed depends on it's regular.
%     filesNumber = getFilesNumber(PATH, false);
    filesNumber = 1000;
    
    % For every dark file, get 2nd columns and mean.
    for i = 1:1:filesNumber
        fileName = strcat(PATH, '\\', prefix, num2str(i), suffix);
        loopTempArray = getStatics(fileName);

        if i == 1
            resultArray = calXAS(loopTempArray, I0_Array, dark_Array);
            continue;
        end

        resultArray = (resultArray + calXAS(loopTempArray, I0_Array, dark_Array)) ./ 2;
    end

end
