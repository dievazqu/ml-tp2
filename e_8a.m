function e_8a()
    load('colesterol.txt');
    x = colesterol(:,2);
    y = colesterol(:,3);

    plot(x,y,'O');
    ylabel('Disminucion del colesterol');
    xlabel('Porcentaje de acatamiento');
end
