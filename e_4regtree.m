function e_4regtree(meas, species)
	K = 10;
	error = 0;
	crossv = crossvalind('Kfold', 50, K);
	crossv = [crossv; crossv; crossv];
	for k=1:K
		[idxTraining idxTesting] = crossv_sets(meas, crossv, k);

		training = meas(idxTraining,:);
		yTraining = species(idxTraining);
		testing = meas(idxTesting, :);
		yTesting = species(idxTesting);
		T = classregtree(training, yTraining);
		error = error + sum(1-strcmp(yTesting, eval(T, testing)));
		
	end
	view(T)
	error = error / (K*size(testing,1))
end


function [idxTraining idxTesting] = crossv_sets(data, crossv, k)
    idxTraining = find(crossv~=k);
    idxTesting = find(crossv==k);
end
