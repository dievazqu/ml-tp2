function e_1b()
    load('provincias.txt');
    load('coordenadas.txt');
    % provincias = provincias(:,[1])
    names = loadstrs('nombres.txt');
    K = 3;
    idx = kmeans(provincias, K);
    imshow('provincias_gray.png');
    hold on;
    for i=1:K
        selected = names(find(idx==i));
        fprintf(1, 'cluster %d:', i);
        fprintf(1,'\n');
        fprintf(1, '\t%s\n', selected{1:end});


        e_1b_paint(coordenadas(find(idx==i),:), e_1b_createclr(i,K));
    end
    % TODO: fijarse si existe una asociacion geografica
    % link al mapa de provincias: http://www.cerebriti.com/uploads/2495106cf29662cf48f02b91af3a79bc.jpg
end

function e_1b_paint(coords, clr)
    for i=1:size(coords,1)
        x = coords(i,1);
        y = coords(i,2);
        plot(x,y,'.', 'MarkerSize',20, 'Color', clr);
    end
end

function c = e_1b_createclr(k, N)
    c = hsv2rgb([(k/N) 1 1]);
end