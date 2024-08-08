function newImage = constraste(image)

pkg load image;
originalHist = imhist(image)

end

function accHist = getAccHist(histTable)
    accHist{1} = [histTable(1), histTable(1)];
    for i = 2:numel(histTable)
        accHist{i} = [histTable(i), histTable(i) + accHist{i-1}];
    end
end