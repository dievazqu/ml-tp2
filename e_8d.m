function e_8d()
    load('colesterol.txt');
    colesterol = sortrows(colesterol, 2);
    x = colesterol(:,2);
    y = colesterol(:,3);

    ksrlin(x,y);
    hold on;
    e_7b_plot(x,y,30);
    v = [0:100];
    p = polyfit(x, y, 5);
    plot(v, polyval(p, v), 'Color', [1 0.5 0]);
end

function e_7b_plot(x,y,neighbors)
    yhat = smooth(x, y, neighbors, 'lowess');
    % plot(x,y,'O', 'Color', 'blue');
    plot(x,yhat, 'Color', [1 0 1]);
    title(sprintf('Polinomio grado 5 & Cantidad de vecinos: %d', neighbors))
    ylabel('Disminucion del colesterol');
    xlabel('Porcentaje de acatamiento');

    sum((y-yhat).^2)
end