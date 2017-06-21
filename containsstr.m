function ans = containsstr(list, x)
    for i=1:length(list)
        elem = list{i};
        if strcmp(elem, x)
            ans = true;
            return;
        end
    end
    ans = false;
end