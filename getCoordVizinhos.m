function vizinhos = getCoordVizinhos(matriz, linha, col, tipoVizinhanca)

    % tipoVizinhanca =
    % 4 -> Vizinhanca 4
    % 8 -> Vizinhanca 8
    % d -> Vizinhanca d

    [imLinhas, imCols] = size(matriz);
    vizinhos = {};

    switch (tipoVizinhanca)
    case 4
        vizinhosPotenciais = [
            linha - 1, col;
            linha + 1, col;
            linha, col - 1;
            linha, col + 1; 
        ];
    case 'd'
        vizinhosPotenciais = [
            linha - 1, col - 1;
            linha - 1, col + 1;
            linha + 1, col - 1;
            linha + 1, col + 1; 
        ];
    case 8
        vizinhosPotenciais = [
            linha - 1, col - 1;
            linha - 1, col + 1;
            linha + 1, col - 1;
            linha + 1, col + 1;
            linha - 1, col;
            linha + 1, col;
            linha, col - 1;
            linha, col + 1; 
        ];
    otherwise
        error("Argumento tipoVizinhanca invalido! (%s). Deve ser 4, 8, ou 'd'.", num2str(tipoVizinhanca));
    end

    vizinhosIndex = 1;

    for i = 1:size(vizinhosPotenciais,1)
        l = vizinhosPotenciais(i,1);
        c = vizinhosPotenciais(i,2);
        if l >= 1 && l <= imLinhas && c >= 1 && c <= imCols
            vizinhos{vizinhosIndex} = [l,c];
            vizinhosIndex++;
        end
    end