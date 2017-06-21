function ans = containsstr(list, x)
    for i=1:length(list)
        elem = list{i};
        if strcmp(elem, x)
            ans = i;
            return;
        end
    end
    ans = -1;
end