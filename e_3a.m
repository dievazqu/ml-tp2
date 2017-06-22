function e_3a()
    load('dialectos.txt');
    dialectosbkup = dialectos;
    dialectos = dialectos(:);
    dialectos = dialectos(find(dialectos~=0))';
    dialectos2 = 1./dialectos;
    dialectos3 = 100 - dialectos;

    % figure;
    z1 = linkage(dialectos2, 'average');
    c1 = cluster(z1, 'MaxClust', 4);
    % z4 = z;
    % dendrogram(z, 0);
    % title('1./ ; average')

    % figure;
    z2= linkage(dialectos2, 'complete');
    c2 = cluster(z2, 'MaxClust', 4);
    % z4=z;
    % dendrogram(z, 0);
    % title('1./ ; complete')

    % figure;
    z3 = linkage(dialectos2, 'single');
    c3 = cluster(z3, 'MaxClust', 4);
    % z1 = z;
    % dendrogram(z, 0);
    % title('1./ ; single')

    % figure;
    z4 = linkage(dialectos3, 'average');
    c4 = cluster(z4, 'MaxClust', 4);
    % z3 = z;
    % dendrogram(z, 0);
    % title('100- ; average')

    % figure;
    z5 = linkage(dialectos3, 'complete');
    c5 = cluster(z5, 'MaxClust', 4);
    % z3=z;
    % dendrogram(z, 0);
    % title('100- ; complete')

    % figure;
    z6 = linkage(dialectos3, 'single');
    c6 = cluster(z6, 'MaxClust', 4);
    % z2 = z;
    % dendrogram(z, 0);
    % title('100- ; single')

    % [[1:25]' cluster(z1,'MaxClust',4) cluster(z2,'MaxClust',4)]
    aux = cluster(z1,'MaxClust',4);
    % aux== cluster(z4,'MaxClust',4)

    % fprintf(1, '%d,',find(aux==1));
    % fprintf(1,'\n');

    % fprintf(1, '%d,',find(aux==2));
    % fprintf(1,'\n');

    % fprintf(1, '%d,',find(aux==3));
    % fprintf(1,'\n');

    % fprintf(1, '%d,',find(aux==4));
    % fprintf(1,'\n');

    % e_3a_maxc(c1, dialectosbkup)
    % e_3a_maxc(c2, dialectosbkup)
    e_3a_maxc(c3, dialectosbkup)
    % e_3a_maxc(c4, dialectosbkup)
    % e_3a_maxc(c5, dialectosbkup)
    % e_3a_maxc(c6, dialectosbkup)
end

function ans = e_3a_maxc(c, dialectos)
    dialectos = [zeros(1,24); dialectos];
    dialectos = [dialectos zeros(25,1)];
    dialectos = dialectos + dialectos';
    for k=1:4
        elems = find(c==k)
        minsimilitude = 100;
        for i=1:length(elems)
            for j=1:length(elems)
                e1 = elems(i);
                e2 = elems(j);
                % fprintf(1, '(%d %d)\n', e1, e2);
                if e1==e2
                    continue;
                end
                minsimilitude = min(minsimilitude, dialectos(e1, e2));
                % fprintf(1, '(%d %d)\n', e1, e2);
            end
        end
        ans(k)=minsimilitude;
    end
end