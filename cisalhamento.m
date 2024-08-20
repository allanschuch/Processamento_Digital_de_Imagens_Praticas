function resultImage = cisalhamento(image, cv, ch)
    [imageRows imageCols] = size(image);
    resultImage = zeros(imageRows + (imageCols*cv), imageCols + (imageRows*ch));

    T = [1,ch,0;
         cv,1,0;
         0,0,1];

    Tinv = inv(T);
    
    for i = 1:size(resultImage, 1)
        for j = 1:size(resultImage, 2)
            coord = afim(i,j,Tinv);
            resultImage(i,j) = image(coord(1), coord(2)); 
        end
    end
end