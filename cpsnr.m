function psnr = cpsnr(filename_image1, filename_image2)
    image1 = imread(filename_image1);
    image2 = imread(filename_image2);
    [mse psnr] = calc_metricas(image1, image2);
end