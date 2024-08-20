function newImageFileName = realce(image)
    filter = [0,1,0;
              1,-4,1;
              0,1,0];

    weight = 1;

    newImage = filtro(image,filter,weight);

    newImageFileName = 'imagem_realcada.bmp';

    imwrite(newImage,newImageFileName);
endfunction


