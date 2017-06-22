function e_2a()
    load fisheriris;
    idx = kmeans(zscore(meas), 3);
    group = [ones(50,1); ones(50,1)+1; ones(50,1)+2];
    confusionmat(group, idx)
end