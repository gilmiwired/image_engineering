% input image
img = imread('card.png');

img_gray = rgb2gray(img);

subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(img_gray);
title('Monochromacy Image');

% make gray image
function img_gray = rgb2gray(img)
    img = double(img);

    R = img(:, :, 1);
    G = img(:, :, 2);
    B = img(:, :, 3);

    img_gray = (R + G + B) / 3;

    img_gray = uint8(img_gray);
end
