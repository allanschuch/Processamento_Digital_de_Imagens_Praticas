function newImageFileName = suaviza(image)
    filter = [1,2,1;
              2,4,2;
              1,2,1];

    weight = 1/16;

    newImage = filtro(image,filter,weight);

    newImageFileName = 'imagem_suavizada.bmp';

    imwrite(newImage,newImageFileName);
endfunction
