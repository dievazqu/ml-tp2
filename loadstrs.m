function strs = loadstrs(filename)

    fid = fopen(filename, 'r', 'n', 'UTF-8');
    strs = {};
    linestr = fgets(fid);
    while linestr ~= -1
        strs{end+1}=strtrim(linestr);
        linestr = fgets(fid);
    end
end