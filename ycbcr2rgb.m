function rgb_image = ycbcr2rgb(ycbcr_image)

  Y = ycbcr_image(:,:,1);  
  Cb = ycbcr_image(:,:,2); 
  Cr = ycbcr_image(:,:,3); 

  Y = double(Y);
  Cb = double(Cb) - 128;
  Cr = double(Cr) - 128;

  R = Y + 1.402 * Cr;
  G = Y - 0.344136 * Cb - 0.714136 * Cr;
  B = Y + 1.772 * Cb;

  R = max(min(R, 255), 0);
  G = max(min(G, 255), 0);
  B = max(min(B, 255), 0);

  rgb_image = cat(3, uint8(R), uint8(G), uint8(B));

end
