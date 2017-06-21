function e_1a()
    load('provincias.txt');
    [coeff score latent] = princomp(zscore(provincias));
    % Cual es la relacion entre PCA y la cantidad de clusters optima?
    cumsum(latent)/sum(latent)
end