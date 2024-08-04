function imFronteira = imFronteira(matriz,tipoFronteira,tipoVizinhanca,linha,col)

    imFronteira = ones(size(matriz));

    % tipoFronteira =
    % 0 -> interna
    % 1 -> externa

    switch(tipoFronteira)
    case 0

    case 1
        coordFronteira = getCoordFronteiraExterna(matriz,linha,col,tipoVizinhanca);
    otherwise
        error("Argumento tipoFronteira invalido! (%s). Deve ser 0(interna) ou 1(externa).", num2str(tipoFronteira));
    end

    for i = 1:size(coordFronteira,2)
        l = coordFronteira{i}(1);
        c = coordFronteira{i}(2);
        imFronteira(l,c) = 0;
    end
end

function coordFronteira = getCoordFronteiraExterna(matriz,linha,col,tipoVizinhanca)
    visitados = containers.Map();
    coordFronteira = {};
    valorFronteira = !matriz(linha,col);
    [coordFronteira, visitados] = procuraFronteiraExterna(matriz,linha,col,valorFronteira,tipoVizinhanca,visitados,coordFronteira);

    else
        coordVizinhos = getCoordVizinhos(matriz,linha,col,tipoVizinhanca);
        for i = 1:numel(coordVizinhos)
            l = coordVizinhos{i}(1);
            c = coordVizinhos{i}(2);
            coordFronteira = procuraFronteiraExterna(matriz,l,c,valorFronteira,tipoVizinhanca,visitados,coordFronteira);
        end
end

function [coordFronteira, visitados] = procuraFronteiraExterna(matriz,linha,col,valorFronteira,tipoVizinhanca,visitados,coordFronteira)
    strLinha = int2str(linha);
    strCol = int2str(col);
    chaveCoord = [strLinha ' ' strCol];
    if isKey(visitados,chaveCoord)
        return;
    else
        visitados(chaveCoord) = true;
    end

    if matriz(linha,col) == valorFronteira
        coordFronteira{numel(coordFronteira) + 1} = [linha,col];
    end
end