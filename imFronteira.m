function imFronteira = imFronteira(bawImage,tipoFronteira,tipoVizinhanca,linha,col)
    addpath('fila');
    %pkg load image;
    %I = imread(imageName);
    %bawImage = im2bw(imageName);
    imFronteira = zeros(size(bawImage));

    coordFronteira = getCoordFronteira(bawImage,linha,col,tipoVizinhanca,tipoFronteira);

    for i = 1:size(coordFronteira,2)
        l = coordFronteira{i}(1);
        c = coordFronteira{i}(2);
        imFronteira(l,c) = 1;
    end
end

function coordFronteira = getCoordFronteira(matriz,linha,col,tipoVizinhanca,tipoFronteira)
    visitados = containers.Map();
    coordFronteira = {};
    valorFronteira = !matriz(linha,col);
    filaVisitas = {[linha,col]};

    while !isempty(filaVisitas)
        [filaVisitas, coordenadas] = dequeue(filaVisitas);
        [coordFronteira, visitados, coordVizinhos] = procuraFronteira(matriz,coordenadas(1),coordenadas(2),valorFronteira,tipoVizinhanca,visitados,coordFronteira,tipoFronteira);
        for i = 1:numel(coordVizinhos)
            l = coordVizinhos{i}(1);
            c = coordVizinhos{i}(2);
            filaVisitas = enqueue(filaVisitas,[l,c]);
        end
    end
end

function [coordFronteira, visitados, coordVizinhos] = procuraFronteira(matriz,linha,col,valorFronteira,tipoVizinhanca,visitados,coordFronteira,tipoFronteira)
    strLinha = int2str(linha);
    strCol = int2str(col);
    coordVizinhos = {};
    chaveCoord = [strLinha ' ' strCol];
    
    if isKey(visitados, chaveCoord)
        return;
    else
        visitados(chaveCoord) = true;
    end

    % tipoFronteira =
    % 0 -> interna
    % 1 -> externa
    
    switch(tipoFronteira)
    case 0
        if matriz(linha,col) != valorFronteira
            coordVizinhos = getCoordVizinhos(matriz,linha,col,tipoVizinhanca);
            for i = 1:numel(coordVizinhos)
                l = coordVizinhos{i}(1);
                c = coordVizinhos{i}(2);
                if matriz(l,c) == valorFronteira
                    coordFronteira{end + 1} = [linha,col];
                end
            end
        end
    case 1
        if matriz(linha,col) == valorFronteira
            coordFronteira{end + 1} = [linha,col];
        else
            coordVizinhos = getCoordVizinhos(matriz,linha,col,tipoVizinhanca);
        end
    otherwise
        error("Argumento tipoFronteira invalido! (%s). Deve ser 0(interna) ou 1(externa).", num2str(tipoFronteira));
    end
end