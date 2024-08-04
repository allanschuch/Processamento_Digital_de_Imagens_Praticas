function saida = redimensionar(I, tipo, fatorX, fatorY)
    [I_rows I_cols] = size(I);
    
    A = zeros(I_rows*fatorY, I_cols*fatorX, "uint8");
    
    [A_rows A_cols] = size(A);
    
    A(1:fatorY:A_rows, 1:fatorX:A_cols) = I(:,:);
    
    %% Interpolação por vizinho mais próximo
    
    if tipo == 1
        
        for (i=1:1:A_rows)
          for (j=1:1:A_cols)
            A(i,j) = I( floor((i-1) / fatorY) + 1, floor((j-1) / fatorX) + 1);
          endfor
        endfor
        
    %% Interpolação por vizinho mais próximo
        
    elseif tipo == 2
        
        for (i=1:1:A_rows)
          for (j=1:1:A_cols)
            Ry = floor((i-1) / fatorY) + 1;
            Rx = floor((j-1) / fatorX) + 1;
            tx = mod((j-1), fatorX);
            ty = mod((i-1), fatorY);
            A(i,j) = interpolacao_bilinear(I,Rx,Ry,fatorX,fatorY,tx,ty);
          endfor
        endfor
    endif
    
  imwrite(A,'img_redimensionada.png');
  saida = 'img_redimensionada.png';  
    
end