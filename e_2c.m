function e_2c()
    load fisheriris;

    ySetosa = [ones(50,1); zeros(100,1)];
    cSetosa = svmtrain(meas, ySetosa);

    yVersicolor = [zeros(50,1); ones(50,1); zeros(50,1)];
    cVersicolor = svmtrain(meas, yVersicolor);

    yVirginica = [zeros(100,1); ones(50,1)];
    cVirginica = svmtrain(meas, yVirginica);

    classifiers = {cSetosa cVersicolor cVirginica};
    e_2c_classify(classifiers, meas(10,:));
end

function e_2c_classify(classifiers, x)
    cSetosa = classifiers{1};
    cVersicolor = classifiers{2};
    cVirginica = classifiers{3};

    vars = size(x,2);
    % prediction = sum(x*(cSetosa.SupportVectors.*repmat(cSetosa.Alpha, 1, vars))',2) - cSetosa.Bias

    acum = 0;
    for i=1:length(cSetosa.Alpha)
        a = cSetosa.Alpha(i);
        sv = cSetosa.SupportVectors(i,:);

        acum = acum + a*sv*x';
    end

    acum + cSetosa.Bias

    % prediction = cSetosa.Alpha'*cSetosa.SupportVectors'*x' + cSetosa.Bias

    % find(prediction<0)
    % length(find(prediction<0))
end