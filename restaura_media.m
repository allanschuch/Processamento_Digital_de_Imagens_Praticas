function image_out = restaura_media(image, filterSize)
    [filtro_media, weight] = gera_filtro_media(filterSize);
    image_out = filtro(image,filtro_media,weight);
end

function [filtro_media, weight] = gera_filtro_media(filterSize)
    if(mod(filterSize,2) != 1)
        error('filterSize deve ser ímpar');
    end

    filtro_media = ones(filterSize);
    weight = 1/sum(sum(filtro_media));
end