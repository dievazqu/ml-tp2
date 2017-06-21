function encoder = encodelbs(labels)
    [encoding original] = encodelbs_rec(labels, [], {});
    encoder = {encoding, original};
end

function [encoding original] = encodelbs_rec(labels, mem, orig)
    if isempty(labels)
        encoding = mem';
        original = orig';
        return;
    end

    current = labels{1};
    labels = labels(2:end);
    if not(containsstr(orig, current))
        orig{end+1}=current;
        mem(end+1) = length(orig);
    end

    [encoding original] = encodelbs_rec(labels, mem, orig);
end