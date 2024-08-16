function filteredImage = filtro(image, weight)
    filteredImage = invertFilter(image);
end

function invertedFilter = invertFilter(filter)
    invertedFilter = fliplr(filter);
    invertedFilter = flipud(invertedFilter);
end