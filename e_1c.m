function e_1c()
    load('provincias.txt');
    load('coordenadas.txt');
    imshow('provincias_gray.png');
    hold on;
    for i=1:size(coordenadas,1)
        x = coordenadas(i,1);
        y = coordenadas(i,2);
        plot(x,y,'r.','MarkerSize',20)
    end
end