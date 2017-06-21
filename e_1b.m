function e_1b()
    load('provincias.txt');
    names = loadstrs('nombres.txt');
    idx = kmeans(zscore(provincias), 6);
    for i=1:6
        selected = names(find(idx==i));
        fprintf(1, 'cluster %d:', i);
        fprintf(1,'\n');
        fprintf(1, '\t%s\n', selected{1:end});
    end
    % TODO: fijarse si existe una asociacion geografica
    % link al mapa de provincias: http://www.cerebriti.com/uploads/2495106cf29662cf48f02b91af3a79bc.jpg
end