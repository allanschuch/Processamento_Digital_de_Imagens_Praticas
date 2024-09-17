function saida = rgbtohsi(og_image)
    normalized_image = normalizaRGB(double(og_image));
    R = og_image(:,:,1);
    G = og_image(:,:,2);
    B = og_image(:,:,3);
    r = normalized_image(:,:,1);
    g = normalized_image(:,:,2);
    b = normalized_image(:,:,3);

    size_image = size(og_image);

    for i = 1:size_image(1)
        for j = 1:size_image(2)
            b_loc = b(i,j);
            g_loc = g(i,j);
            r_loc = r(i,j);

            if(b_loc <= g_loc)
                H(i,j) = acos((0.5*((r_loc - g_loc) + (r_loc - b_loc))) / ((r_loc - g_loc)^2 + (r_loc - b_loc)*(g_loc - b_loc))^0.5)
            else
                H(i,j) = 2*pi*acos((0.5*((r_loc - g_loc) + (r_loc - b_loc))) / ((r_loc - g_loc)^2 + (r_loc - b_loc)*(g_loc - b_loc))^0.5)
            end

            S(i,j) = 1 - 3 * min(r_loc, g_loc, b_loc);
            I(i,j) = (R + G + B) / (3 * 255);
        end
    end
    
    saida(:,:,1) = H(:,:);
    saida(:,:,2) = S(:,:);
    saida(:,:,3) = I(:,:);
end

function saida = normalizaRGB(rgb_image)
    size_image = size(rgb_image);

    for i = 1:size_image(1)
        for j = 1:size_image(2)
            soma_de_pesos = rgb_image(i,j,1) + rgb_image(i,j,2) + rgb_image(i,j,3);
            r(i,j) = rgb_image(i,j,1)/soma_de_pesos;
            g(i,j) = rgb_image(i,j,2)/soma_de_pesos;
            b(i,j) = rgb_image(i,j,3)/soma_de_pesos;
        end
    end

    saida(:,:,1) = r(:,:);
    saida(:,:,2) = g(:,:);
    saida(:,:,3) = b(:,:);
end