function e_3b()
    load('dialectos.txt');
    dialectosbkup = dialectos;
    dialectos = dialectos(:);
    dialectos = dialectos(find(dialectos~=0))';
    dialectos2 = 100 - dialectos;

    z1 = linkage(dialectos2, 'average');
    % c1 = cluster(z1, 'MaxClust', 4);
    dendrogram(z1, 0);
end