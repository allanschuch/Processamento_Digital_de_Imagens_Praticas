function newImageName = contraste(image, L)

    pkg load image;

    figure;
    subplot(2,2,1);
    imshow(image);
    
    originalHist = imhist(image);

    subplot(2,2,2);
    bar(originalHist);

    normalizedHist = normalizeHist(originalHist,image);
    accHist = cumsum(normalizedHist);
    lookUpTable = getLookUptable(accHist, L);
    newImage = arrayfun(@(x) lookUpTable(x), image);

    subplot(2,2,3);
    imshow(newImage);

    subplot(2,2,4);
    imhist(newImage);

    newImageName = 'result_best_constrast.bmp';
    imwrite(newImage,newImageName);
end

function normalizedHist = normalizeHist(originalHist, image)
    [lines, cols] = size(image);
    normalizedHist = originalHist / (lines * cols);
end

function lookUpTable = getLookUptable(accHist, L)
    lookUpTable = uint8(accHist(:) * (L-1));
end