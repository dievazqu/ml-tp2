function e_7a()
    load('autos.txt');
    x = autos(:,2);
    y = autos(:,3);
    model = ksrlin(x,y);

    model
end