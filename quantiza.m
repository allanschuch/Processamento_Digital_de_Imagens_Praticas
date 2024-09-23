function saida = quantiza(imagem, bitsC1, bitsC2, bitsC3, type)


    pkg load image;
    og_image = imagem;
    
    if (strcmp(type,'ycbcr'))
        imagem = rgb2ycbcr(imagem);
    end
    
    c1 = imagem(:,:,1);
    c2 = imagem(:,:,2);
    c3 = imagem(:,:,3);

    figure;

    subplot(2,2,1);
    imshow(c1);
    title("C1");

    subplot(2,2,2);
    imshow(c2);
    title("C2");

    subplot(2,2,3);
    imshow(c3);
    title("C3");

    subplot(2,2,4);
    imshow(og_image);
    title("Original");

    c1 = quantizar(c1, bitsC1);
    c2 = quantizar(c2, bitsC2);
    c3 = quantizar(c3, bitsC3);

    imagem = cat(3, c1, c2, c3);



    if (strcmp(type,'ycbcr'))
        figure;

        subplot(2,2,1);
        imshow(c1);
        title("Y - Quantizado");

        subplot(2,2,2);
        imshow(c2);
        title("Cb - Quantizado");

        subplot(2,2,3);
        imshow(c3);
        title("Cr - Quantizado");

        imagem = ycbcr2rgb(imagem);
        
        subplot(2,2,4);
        imshow(imagem);
        title("Reconvertida em RGB - Quantizada");
    end


    saida = imagem;

    figure;

    subplot(1,2,1);
    imshow(og_image);
    title("Original");

    subplot(1,2,2);
    imshow(imagem);
    title("Quantizada");
end

function saida = quantizar(matriz, nbits)
    niveis_quantizacao = 2^nbits;

    passo = floor(256/niveis_quantizacao);

    saida = floor(matriz ./ passo) .* passo + passo/2;
end

