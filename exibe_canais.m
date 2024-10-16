

function = exibe_canais(image, type)
    figure;

    c1 = image(:,:,1);
    c2 = image(:,:,2);
    c3 = image(:,:,3);

    switch(type)
    case "rgb"
        subplot(2,2,1);
        imshow(image);
        title("Visualização RGB");

        subplot(2,2,2);
        imshow(c1);
        title("Canal Vermelho");

        subplot(2,2,3);
        imshow(c2);
        title("Canal Verde");

        subplot(2,2,4);
        imshow(c3);
        title("Canal Azul");

    case "hsi"
        subplot(1,3,1);
        imshow(c1);
        title("Canal H");

        subplot(1,3,2);
        imshow(c2);
        title("Canal S");

        subplot(1,3,3);
        imshow(c3);
        title("Canal I");
    end
end
