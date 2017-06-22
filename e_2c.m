function e_2c()
    load fisheriris;

    ySetosa = [ones(50,1); zeros(100,1)];
    cSetosa = svmtrain(meas, ySetosa);

    yVersicolor = [zeros(50,1); ones(50,1); zeros(50,1)];
    cVersicolor = svmtrain(meas, yVersicolor);

    yVirginica = [zeros(100,1); ones(50,1)];
    cVirginica = svmtrain(meas, yVirginica);

    classifiers = {cSetosa cVersicolor cVirginica};
    e_2c_classify(classifiers, meas);
end

function e_2c_classify(classifiers, x)
    cSetosa = classifiers{1};
    cVersicolor = classifiers{2};
    cVirginica = classifiers{3};

    vars = size(x,2);
    % prediction = sum(x*(cSetosa.SupportVectors.*repmat(cSetosa.Alpha, 1, vars))',2) - cSetosa.Bias
    
    for i=1:size(x,1)
	xx = x(i,:);
	xx = (xx + cSetosa.ScaleData.shift) .* cSetosa.ScaleData.scaleFactor;
	prediction(i) = xx * (cSetosa.SupportVectors)' * cSetosa.Alpha + cSetosa.Bias;
    end
    % prediction = cSetosa.Alpha'*cSetosa.SupportVectors'*x' + cSetosa.Bias

    
end
