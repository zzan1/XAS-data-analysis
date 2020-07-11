function resultArray = calXASMeanMultifile(PATH, I0_Array, dark_Array)
    %CALXAS calculate XAS result according to this fomular log((I0-dark)/(I1-dark));

    % For several directories,  n * 15000 times measurements.

    [dirNumbers, dirNameStart] = getFilesNumber(PATH, true);

    %  I-reaction(prefix)31(order)_f000000000000_(middle)35(secondOrder)_ascii(suffix)
    filePattern = "(?<prefix>\D*?)(?<order>\d+)(?<middle>_f\d+_)(?<secondOrder>\d+)(?<suffix>_\D+)";
    tokens = regexp(dirNameStart, filePattern, "names");

    if isempty(tokens)
        throw(exception);
    end

    averageCount = 1000;

    % For every  file, get 2nd columns and mean.
    for i = 1:1:averageCount

        % for every dirctroiy, get i file and mean.
        for j = 0:1:dirNumbers - 1
            dirName = strcat(tokens.prefix, num2str(str2double(tokens.order) + j), tokens.middle, num2str(str2double(tokens.secondOrder) + j), tokens.suffix);
            dirPath = strcat(PATH, '\\', dirName);

            fileName = strrep(dirName, tokens.suffix, strcat('_', num2str(i), '.txt'));
            filePath = strcat(dirPath, '\\', fileName);

            loopTempArray = getStatics(filePath);

            if j == 0
                middleResultArray = calXAS(loopTempArray, I0_Array, dark_Array);
                continue;
            end

            middleResultArray = (middleResultArray + calXAS(loopTempArray, I0_Array, dark_Array)) ./ 2;

        end

        if i == 1
            resultArray = middleResultArray;
            continue;
        end

        resultArray = (resultArray + middleResultArray) ./ 2;

    end

    diary off
end

function result = calXAS(I_Array, I0_Array, dark_Array)
    % result = log((I0-dark)/(I1-dark))

    numerator = I0_Array - dark_Array;
    denominator = I_Array - dark_Array;
    result = log10(numerator ./ denominator);

    result = real(result);
end
