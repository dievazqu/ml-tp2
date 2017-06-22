function e_6c_i()
    load fisheriris;

    group = [ones(50,1); ones(50,1)+1; ones(50,1)+2];

    for k=[1 5 10]
        idxTraining = [1:150];
        idxTesting = idxTraining;

        training = meas(idxTraining,:);
        testing = meas(idxTesting, :);
        yTraining = group(idxTraining);
        yTesting = group(idxTesting);

        prediction = e_6c_classify(training, yTraining, testing, k);

        confusion = confusionmat(yTesting, prediction)
    end
end

function [idxTraining idxTesting] = e_6c_sets(data, crossv, k)
    idxTraining = find(crossv~=k);
    idxTesting = find(crossv==k);
end

function prediction = e_6c_classify(training, yTraining, testing, k)
    prediction = [];
    for i=1:size(testing,1)
        x = testing(i,:);
        idx = knnsearch(training, x, 'K', k);
        prediction = [prediction; mode(yTraining(idx))];
    end
end