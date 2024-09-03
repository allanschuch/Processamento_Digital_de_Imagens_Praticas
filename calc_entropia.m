function entropia = calc_entropia(image)

    pkg load image;

    originalHist = imhist(image);
    normalizedHist = normalizeHist(originalHist,image);

    aux = [];
    j = 1;

    for i = 1:size(normalizedHist,1)
        if(normalizedHist(i) != 0)
            aux(j) = normalizedHist(i);
            j++;
        end
    end

    entropia = -sum(aux .* log2(aux));
end

function normalizedHist = normalizeHist(originalHist, image)
    [lines, cols] = size(image);
    normalizedHist = originalHist / (lines * cols);
end