function [mse, psnr] = calc_metricas(image1, image2)
    mse = calc_mse(image1,image2);
    psnr = calc_psnr(mse);
end

function mse = calc_mse(image1, image2)
    [m n] = size(image1);
    mse = double(image1) - double(image2);
    mse = mse.^2;
    mse = sum(sum(mse));
    mse = mse / (m * n);
end

function psnr = calc_psnr(mse)
    psnr = 20*log10(255/sqrt(mse));
end