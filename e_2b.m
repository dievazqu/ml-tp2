function e_2b()
    load fisheriris;
    z = linkage(pdist(zscore(meas), 'euclidean'), 'complete');
    idx = cluster(z, 'MaxClust', 3);
    group = [ones(50,1); ones(50,1)+1; ones(50,1)+2];
    confusionmat(group, idx)


    dendrogram(z, 150)
    set(gca,'XTick',[])
    set(gca,'XTickLabels',{})
    % set(gca,'XColor','black')

    % draw_vline(50.5)
    % draw_vline(100.5)

    % xlabel('position in species array', 'Color', 'black')
end

function draw_vline(x)
    yL = get(gca,'YLim');
    line([x x],yL,'Color',[170 170 170]/255);
end