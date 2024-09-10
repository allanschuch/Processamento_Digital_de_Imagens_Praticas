function img_uint8 = convert_double2uint8(img)
    img_normalized = (img - min(img(:))) / (max(img(:)) - min(img(:)));
    img_uint8 = uint8(255 * img_normalized);
end