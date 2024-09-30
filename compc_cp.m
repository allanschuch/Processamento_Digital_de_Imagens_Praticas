function [bpp_imagem_gerada, psnr] = compc_cp(og_image_name, quality)

    og_image = imread(og_image_name);
    filename = 'jpg_com_perdas.jpg';
    imwrite(og_image, filename, 'Quality', quality);
    imagem_gerada = imread(filename);
    
    bpp_og_image = calc_bpp(og_image_name);
    bpp_imagem_gerada = calc_bpp(filename);

    [mse, psnr] = calc_metricas(og_image, imagem_gerada);

    figure;
    subplot(1,2,1);
    imshow(og_image);
    title('Imagem original', 'FontSize', 20);

    subplot(1,2,2);
    imshow(imagem_gerada);
    title(['Imagem exportada - BPP = ' num2str(bpp_imagem_gerada) ' bits'], 'FontSize', 20);
end

function bpp = calc_bpp(filename)
    imagem = imread(filename);
    im_info = imfinfo(filename);
    filesize_bits = im_info.FileSize*8;
    num_pixels_image = size(imagem,1) * size(imagem,2);
    bpp = filesize_bits / num_pixels_image;
end