function bpp = compc_sp(og_image_name)
    og_image = imread(og_image_name);
    filename = 'png_sem_perdas.png';
    imwrite(og_image, filename, 'png');
    imagem_gerada = imread(filename);
    
    bpp_og_image = calc_bpp(og_image_name);
    bpp_imagem_gerada = calc_bpp(filename);

    figure;
    subplot(1,2,1);
    imshow(og_image);
    title(['Imagem original - BPP = ' num2str(bpp_og_image) ' bits'], 'FontSize', 20);

    subplot(1,2,2);
    imshow(imagem_gerada);
    title(['Imagem exportada - BPP = ' num2str(bpp_imagem_gerada) ' bits'], 'FontSize', 20);

    bpp = [bpp_og_image bpp_imagem_gerada];
end

function bpp = calc_bpp(filename)
    imagem = imread(filename);
    im_info = imfinfo(filename);
    filesize_bits = im_info.FileSize*8;
    num_pixels_image = size(imagem,1) * size(imagem,2);
    bpp = filesize_bits / num_pixels_image;
end