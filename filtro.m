function filteredImage = filtro(image,filter,weight)
    filter = invertFilter(filter);
    extendedMatrix = extendMatrix(image, filter);
    filteredImage = zeros(size(image,1), size(image,2));
    offsetSize = floor(size(filter,1)/2);

    for i = 1:size(filteredImage,1)
        for j = 1:size(filteredImage,2)
            filteredImage(i,j) = applyFilter(extendedMatrix, filter, i+offsetSize, j+offsetSize, weight,offsetSize);
        end
    end

    filteredImage = uint8(rescale(filteredImage,0,255));
end

function invertedFilter = invertFilter(filter)
    invertedFilter = fliplr(filter);
    invertedFilter = flipud(invertedFilter);
end

function extendedMatrix = extendMatrix(matrix,filter)
    filterSize = size(filter, 2);
    offset = floor(filterSize/2);
    [matrixRows, matrixCols] = size(matrix);
    extendedMatrix = zeros(matrixRows + (2 * offset), matrixCols + (2 * offset));
    [extendedMatrixRows, extendedMatrixCols] = size(extendedMatrix);
    extendedMatrix(offset + 1:extendedMatrixRows - offset, offset + 1:extendedMatrixCols - offset) = matrix(:,:);
end

function newValue = applyFilter(matrix, filter, row, col, weight,offsetSize)
    tempMatrix = matrix(row-offsetSize:row+offsetSize, col-offsetSize:col+offsetSize) .* filter;
    tempMatrix = tempMatrix * weight;
    newValue = sum(sum(tempMatrix));
end
