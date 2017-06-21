function ys = map(f, ca)
    ys = {};
    for i=1:length(ca)
        elem = cellstr(ca{i});
        elem = elem{1};
        ys{end+1}=f(elem);
    end
end