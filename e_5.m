function T = e_5()
	[a,data_str,c] = xlsread('tateti.xls');
	x_str = data_str(:,1:9);
	y = data_str(:, 10);
	x(strcmp(x_str, 'x')) = 1;
	x(strcmp(x_str, 'o')) = 0;
	x(strcmp(x_str, 'b')) = -1;
	x = reshape(x, 958, 9);
	T = regtree(x,y);
end

function T = regtree(x, y)
	K = 10;
	error = 0;
	crossv = crossvalind('Kfold', size(x,1), K);
	for k=1:K
		[idxTraining idxTesting] = crossv_sets(x, crossv, k);

		training = x(idxTraining,:);
		yTraining = y(idxTraining);
		testing = x(idxTesting, :);
		yTesting = y(idxTesting);
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
