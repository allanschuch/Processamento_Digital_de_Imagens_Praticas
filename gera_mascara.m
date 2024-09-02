function mascara = gera_mascara(imagem, tipoFiltro, raioMenor, raioMaior)

    % tipoFiltro:

    % 1-Eliminar bordas verticais
    % 2-Eliminar bordas horizontais
    % 3-Passa
    % 4-Rejeita

    switch(tipoFiltro)
        case 1
            [imRows, imCols] = size(imagem);
            mascara = ones(imRows, imCols);
            centro = [floor(imRows/2) floor(imCols/2)];

            for i = 1:imRows
                for j = 1:imCols
                    dist = calc_de(centro(2),centro(1),j,i);
                    if dist >= raioMenor && dist <= raioMaior
                        mascara(i,j) = 1;
                    elseif i >= centro(1) - raioMaior && i <= centro(1) + raioMaior;
                        mascara(i,j) = 0;
                    end
                end
            end
        case 2
            [imRows, imCols] = size(imagem);
            mascara = ones(imRows, imCols);
            centro = [floor(imRows/2) floor(imCols/2)];

            for i = 1:imRows
                for j = 1:imCols
                    dist = calc_de(centro(2),centro(1),j,i);
                    if dist >= raioMenor && dist <= raioMaior
                        mascara(i,j) = 1;
                    elseif j >= centro(1) - raioMaior && j <= centro(1) + raioMaior;
                        mascara(i,j) = 0;
                    end
                end
            end
        case 3
            mascara = setMascara(imagem, 1, raioMenor, raioMaior);
        case 4
            mascara = setMascara(imagem, 0, raioMenor, raioMaior);
        otherwise
            error("tipoFiltro invalido");
    endswitch

endfunction

function mascara = setMascara(imagem, passa, raioMenor, raioMaior)
    
    [imRows, imCols] = size(imagem);

    centro = [floor(imRows/2) floor(imCols/2)];

    if passa
        mascara = zeros(imRows, imCols);
    else
        mascara = ones(imRows, imCols);
    end

    for i = 1:imRows
        for j = 1:imCols
            dist = calc_de(centro(2),centro(1),j,i);
            if dist >= raioMenor && dist <= raioMaior
                mascara(i,j) = passa;
            end
        end
    end
endfunction

function de = calc_de (Px, Py, Qx, Qy)
  de = sqrt((Px-Qx)^2 + (Py-Qy)^2);
endfunction