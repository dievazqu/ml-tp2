function enc = encstr(str, encoder)
    encodings = encoder{1};
    original = encoder{2};
    index = indexofstr(original, str);
    enc = encodings(index);
end