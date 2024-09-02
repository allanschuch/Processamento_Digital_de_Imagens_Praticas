function img_transformada_name = filtra_freq(imagem, mascara)

    figure;
    subplot(2,2,1);
    imshow(imagem, []);
    subplot(2,2,4);
    imshow(mascara);

    img_spectre_name = 'espectro_fourier_image.png';
    img_transformada_name = 'img_transformada.png';

    img_transformada = fft2(imagem);
    img_shifted = fftshift(img_transformada);

    subplot(2,2,2);
    imshow(log(abs(img_shifted)), []);
    imwrite(img_shifted, img_spectre_name);

    img_shifted = img_shifted .* mascara;

    %subplot(2,2,4);
    %imshow(log(1 + abs(img_shifted)), []);

    img_transformada = ifftshift(img_shifted);
    img_filtrada = ifft2(img_transformada);

    subplot(2,2,3);
    imshow(abs(img_filtrada), []);
    imwrite(img_transformada, img_transformada_name);
end