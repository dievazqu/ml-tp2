function e_1a()
    load('provincias.txt');
    [coeff score latent] = princomp(provincias);
    % Cual es la relacion entre PCA y la cantidad de clusters optima?
    plot(cumsum(latent)/sum(latent))
    ylabel('Varianza explicada');
    xlabel('Cantidad de clusters')
end