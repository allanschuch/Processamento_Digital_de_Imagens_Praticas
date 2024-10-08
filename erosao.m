function imagem_erodida = erosao(imagem, elem_est)
    imagem_erodida = extendMatrix(imagem, elem_est);
    %matrix_extendida = extendMatrix(imagem, elem_est);
    %imagem_erodida = zeros(size(imagem,1), size(imagem,2));
    %offsetSize = floor(size(elem_est,1)/2);
end

function extendedMatrix = extendMatrix(matrix,filter)
    filterSize = size(filter);
    offset_rows = floor(filterSize(1)/2);
    offset_cols = floor(filterSize(2)/2);
    [matrixRows, matrixCols] = size(matrix);
    extendedMatrix = zeros(matrixRows + (2 * offset_rows), matrixCols + (2 * offset_cols));
    [extendedMatrixRows, extendedMatrixCols] = size(extendedMatrix);
    extendedMatrix(offset_rows + 1:extendedMatrixRows - offset_rows, offset_cols + 1:extendedMatrixCols - offset_cols) = matrix(:,:);
end

function newValue = aplicaErosao(matrix, elem_est, row, col, offsetSize)
    soma_elementos_do_elem_est = sum(sum(elem_est));
    tempMatrix = matrix(row-offsetSize:row+offsetSize, col-offsetSize:col+offsetSize) .* elem_est;
    newValue = soma_elementos_do_elem_est == tempMatrix;
end