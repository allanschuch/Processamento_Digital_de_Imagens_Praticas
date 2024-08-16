function filteredImage = filtro(image,filter,weight)
    filter = invertFilter(filter);
    filteredImage = extendMatrix(image, filter)
end

function invertedFilter = invertFilter(filter)
    invertedFilter = fliplr(filter);
    invertedFilter = flipud(invertedFilter);
end

function extendedMatrix = extendMatrix(matrix,filter)
    filterSize = size(filter, 2);
    offset = floor(filterSize/2)
    [matrixRows, matrixCols] = size(matrix);
    extendedMatrix = zeros(matrixRows + (2 * offset), matrixCols + (2 * offset));
    [extendedMatrixRows, extendedMatrixCols] = size(extendedMatrix);

    extendedMatrix(offset + 1:extendedMatrixRows - offset, offset + 1:extendedMatrixCols - offset) = matrix(:,:);
end