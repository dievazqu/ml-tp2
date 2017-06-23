function e_8c()
    load('colesterol.txt');
    colesterol = sortrows(colesterol, 2);
    x = colesterol(:,2);
    y = colesterol(:,3);

    ksrlin(x,y);

    e_7b_plot(x,y,5);
    e_7b_plot(x,y,10);
    e_7b_plot(x,y,30);
end

function e_7b_plot(x,y,neighbors)
    yhat = smooth(x, y, neighbors, 'lowess');
    figure;
    plot(x,y,'O', 'Color', 'blue');
    hold on;
    plot(x,yhat, 'Color', 'red');
    title(sprintf('Cantidad de vecinos: %d', neighbors))
    ylabel('Disminucion del colesterol');
    xlabel('Porcentaje de acatamiento');

    sum((y-yhat).^2)
end