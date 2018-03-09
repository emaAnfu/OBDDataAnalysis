function [X,Y] = CreateDataset(datasetName, X, Y, newX, newY)
% function CreateDataset()
% the function adds a measure data session to the dataset
%
% datasetName - name of the stored dataset 
% X - current dataset (variables): each row is an example, each column a
% variable (-1 if first measure)
% Y - current dataset (labels): each row is an example
% newX - new measure, row
% newY - new measure label, scalar
%
% X - new dataset
% Y - new dataset
% CreateDataset();

if (X == -1)
    X = newX;
    Y = newY;
    save(datasetName, 'X', 'Y');
else
    load(datasetName);
    if ((size(newX,2)~= size(X,2)) || (size(newY,2)~=1))
        display('Dimensions not consistent.');
    else
        X = [X; newX];
        Y = [Y; newY];
        save(datasetName, 'X', 'Y');
    end
end

end