function cellIsPresent = cellIsPresent(cellArray, item)
    cellArraySize = numel(cellArray);
    for i = 1:cellArraySize
        if isequal(cellArray{i}, item)
            cellIsPresent = true;
            return;
        endif
    end
    cellIsPresent = false;
end