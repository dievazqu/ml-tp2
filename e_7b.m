function e_7b()
    load('autos.txt');
    x = autos(:,2);
    y = autos(:,3);

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
    ylabel('Distancia [ft]')
    xlabel('Velocidad [miles/h]')

    sum((y-yhat).^2)
end