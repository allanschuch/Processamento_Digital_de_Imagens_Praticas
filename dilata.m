function imagem_dilatada_name = dilata(imagem, elem_est)
    matrix_extendida = extendMatrix(imagem, elem_est);
    imagem_dilatada = zeros(size(imagem,1), size(imagem,2));
    elem_est_size = size(elem_est);
    offset_rows = floor(elem_est_size(1)/2);
    offset_cols = floor(elem_est_size(2)/2);

    for i = 1:size(imagem_dilatada,1)
        for j = 1:size(imagem_dilatada,2)
            imagem_dilatada(i,j) = aplicaDilatacao(matrix_extendida, elem_est, i+offset_rows, j+offset_cols, offset_cols,offset_rows);
        end
    end

    imagem_dilatada_name = 'imagem_dilatada.png';
    imwrite(imagem_dilatada, imagem_dilatada_name);
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

function newValue = aplicaDilatacao(matrix, elem_est, row, col, offset_cols, offset_rows)
    tempMatrix = matrix(row-offset_rows:row+offset_rows, col-offset_cols:col+offset_cols) .* elem_est;
    newValue = sum(sum(tempMatrix)) != 0;
end