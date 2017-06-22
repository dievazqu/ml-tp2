function e_2c()
    load fisheriris;

    group = [ones(50,1); ones(50,1)+1; ones(50,1)+2];

    K = 10;
    crossv = crossvalind('Kfold', 50, K);
    crossv = [crossv; crossv; crossv];
    confusion = zeros(3,3);
    for k=1:K
        [idxTraining idxTesting] = e_2c_sets(meas, crossv, k);

        training = meas(idxTraining,:);
        testing = meas(idxTesting, :);
        
        % ySetosa = [ones(50,1); zeros(100,1)];
        ySetosa = idxTraining<=50;
        cSetosa = svmtrain(training, ySetosa);

        % yVersicolor = [zeros(50,1); ones(50,1); zeros(50,1)];
        yVersicolor = idxTraining>50 & idxTraining<=100;
        cVersicolor = svmtrain(training, yVersicolor);

        % yVirginica = [zeros(100,1); ones(50,1)];
        yVirginica = idxTraining>100;
        cVirginica = svmtrain(training, yVirginica);

        yTesting = double(idxTesting>50) + double(idxTesting>100) + 1;

        classifiers = {cSetosa cVersicolor cVirginica};
        prediction = e_2c_classify(classifiers, testing);

        currentconfusion = confusionmat(yTesting, prediction);
        confusion = confusion + currentconfusion;
    end
    confusion = confusion/K
    % prediction = e_2c_classify(classifiers, meas);

    % confusionmat(group, prediction)
end

function [idxTraining idxTesting] = e_2c_sets(data, crossv, k)
    idxTraining = find(crossv~=k);
    idxTesting = find(crossv==k);
end

function result = e_2c_classify(classifiers, x)
    cSetosa = classifiers{1};
    cVersicolor = classifiers{2};
    cVirginica = classifiers{3};

    vars = size(x,2);
    % prediction = sum(x*(cSetosa.SupportVectors.*repmat(cSetosa.Alpha, 1, vars))',2) - cSetosa.Bias
    minK = -1;
    prediction = zeros(1,size(x,1)) + 1000;
    for k=1:length(classifiers)
        classifier = classifiers{k};
        for i=1:size(x,1)
            xx = x(i,:);
            xx = (xx + classifier.ScaleData.shift) .* classifier.ScaleData.scaleFactor;
            p = xx * (classifier.SupportVectors)' * classifier.Alpha + classifier.Bias;
            if p < prediction(i)
                prediction(i) = min(p, prediction(i));
                minK(i) = k;
            end
        end
    end

    result = minK';
end
