function e_6b()
    load fisheriris;

    meas = meas(:,[1 2]);

    group = [ones(50,1); ones(50,1)+1; ones(50,1)+2];

    CK = 10;
    crossv = crossvalind('Kfold', 50, CK);
    crossv = [crossv; crossv; crossv];

    for k=[1 5 10]
        confusion = zeros(3,3);
        for ck=1:CK
            [idxTraining idxTesting] = e_6a_sets(meas, crossv, ck);

            training = meas(idxTraining,:);
            testing = meas(idxTesting, :);
            yTraining = group(idxTraining);
            yTesting = group(idxTesting);
            


            prediction = e_6a_classify(training, yTraining, testing, k);

            currentconfusion = confusionmat(yTesting, prediction);
            confusion = confusion + currentconfusion;
        end
        confusion = confusion/CK
    end

    % prediction = e_2c_classify(classifiers, meas);

    % confusionmat(group, prediction)
end

function [idxTraining idxTesting] = e_6a_sets(data, crossv, k)
    idxTraining = find(crossv~=k);
    idxTesting = find(crossv==k);
end

function prediction = e_6a_classify(training, yTraining, testing, k)
    prediction = [];
    for i=1:size(testing,1)
        x = testing(i,:);
        idx = knnsearch(training, x, 'K', k);
        prediction = [prediction; mode(yTraining(idx))];
    end
end