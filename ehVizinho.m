function retval = ehVizinho(originLine, originCol, destLine, destCol, tipoVizinhanca)

    % tipoVizinhanca =
    % 4 -> Vizinhanca 4
    % 8 -> Vizinhanca 4
    % d -> Vizinhanca 4

    switch(tipoVizinhanca)
    case 4
        if destLine == originLine
            retval = destCol == originCol - 1 || destCol == originCol + 1;
        elseif destCol == originCol
            retval = destLine == originLine - 1 || destLine == originLine + 1;
        else
            retval = false;
        endif
    case 'd'
        if destLine == originLine + 1
            retval = destCol == originCol + 1 || destCol == originCol - 1;
        elseif destLine == originLine - 1
            retval = destCol == originCol + 1 || destCol == originCol - 1;
        else
            retval = false;
        end
    case 8
        retval = ehVizinho(originLine, originCol, destLine, destCol, 4) || ehVizinho(originLine, originCol, destLine, destCol, 'd');
    otherwise
        error("Argumento tipoVizinhanca invalido! (%s). Deve ser 4, 8, ou 'd'.", num2str(tipoVizinhanca));
    end
end