function resultImageName = cisalhamento(image_name, cv, ch)
    image = imread(image_name);
    [imageRows imageCols] = size(image);
    resultImage = zeros(imageRows + ceil(imageCols*cv), imageCols + ceil(imageRows*ch));

    T = [1,ch,0;
         cv,1,0;
         0,0,1];

    Tinv = inv(T);
    
    for i = 1:size(resultImage, 1)
        for j = 1:size(resultImage, 2)
            coord = afim(i,j,Tinv);
            row = ceil(coord(1));
            col = ceil(coord(2));
            if (row <= imageRows && col <= imageCols)
                if (row > 0 && col > 0)
                    resultImage(i,j) = image(row, col);
                end
            end  
        end
    end

    resultImage = uint8(rescale(resultImage,0,255));

    resultImageName = 'imagem_cisalhamento.bmp';

    imwrite(resultImage,resultImageName);
end