function resultArray = calculateDarkMean(PATH, prefix, suffix)
    %CALCULATEMEAN import all statics within a dir and calculate their mean

    % FileName rule, can be changed depends on it's regular.
    filesNumber = getFilesNumber(PATH, false);
    % For every dark file, get 2nd columns and mean.
    for i = 1:1:filesNumber
        fileName = strcat(PATH, '\\', prefix, num2str(i), suffix);
        loopTempArray = getStatics(fileName);

        if i == 1
            resultArray = loopTempArray;
            continue;
        end

        resultArray = (resultArray + loopTempArray) ./ 2;
    end

end
