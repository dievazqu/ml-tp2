function e_8b()
    load('colesterol.txt');
    x = colesterol(:,2);
    y = colesterol(:,3);

    bons = [];
    for i=1:8
        p = polyfit(x, y, i);
        [bon r] = bondad(y, polyval(p,x));
        bons = [bons bon];
    end

    plot(bons);
    xlabel('Grado del polinomio');
    ylabel('Bondad del ajuste');

    p = polyfit(x, y, 5);
    figure;
    plot(x,y,'O');
    hold on;
    v = [0:100];
    plot(v, polyval(p, v), 'Color', 'red');
    xlabel('Porcentaje de acatamiento');
    ylabel('Disminucion de colesterol');
    title('Curva ajustada con polinomio de grado 5');
    hold off;

    [bon r] = bondad(y, polyval(p,x));
    figure;
    plot(x,r, 'O', 'Color', 'red');
    ylabel('Residuo');
    xlabel('Porcentaje de acatamiento');
end