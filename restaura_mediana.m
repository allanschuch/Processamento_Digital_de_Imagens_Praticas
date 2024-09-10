function image_out = restaura_mediana(image, filterSize)
    if(mod(filterSize,2) != 1)
            error('filterSize deve ser ímpar');
    end
    filtro_mediana = ones(filterSize);
    image_out = filtro(image,filtro_mediana,1,1);
end