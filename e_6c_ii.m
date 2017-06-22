function e_6c_ii()
    load fisheriris;

    group = [ones(50,1); ones(50,1)+1; ones(50,1)+2];
    n = 500;

    for k=[1 5 10]
        confusion = zeros(3,3);
        acum = 0;
        for t=1:n

            idx = randperm(150);
            idxTraining = idx(1:100);
            idxTesting = idx(101:150);

            training = meas(idxTraining,:);
            testing = meas(idxTesting, :);
            yTraining = group(idxTraining);
            yTesting = group(idxTesting);

            prediction = e_6c_classify(training, yTraining, testing, k);

            acum = acum + sum(abs(yTesting - prediction));

        end
        fprintf(1, 'El error para k=%d es: %.6f\n', k, acum/(50*n))
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