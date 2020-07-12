function [dirNumbers, dirNameStart] = getFilesNumber(staticsDir, filesIsDir)
    %GETFILES Fetch all the statics files within staticsDir
    % staticsDir: file directory
    % dirNumbers: The number of files in staticDir;
    % dirNameList: The files name sorted according to the number within file name.

    filesAll = dir(staticsDir);

    if (~filesIsDir)
        files = filesAll(~[filesAll.isdir]);
        dirNumbers = 0;
    else
        files = filesAll([filesAll.isdir]);
        dirNumbers = -2;
    end

    [~, idx] = natsortfiles({files.name}); %list is now in ascending name orde

    dirNameList = {files(idx).name};
    dirNameStart = dirNameList{3};
    dirNumbers = dirNumbers + numel(dirNameList);
end
