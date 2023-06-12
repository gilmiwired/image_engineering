image = imread('card.png');
image = im2double(image);

% define T,Tinv,S
T = [0.31399022 0.63951294 0.04649755; 0.15537241 0.75789446 0.08670142; 0.01775239 0.10944209 0.87256922];
Tinv = [5.47221206 -4.6419601 0.16963708; -1.1252419 2.29317094 -0.1678952; 0.02980165 -0.19318073 1.16364789];

S_protan = [0 1.05118294 -0.05116099; 0 1 0; 0 0 1];
S_deutan = [1 0 0; 0.9513092 0 0.04866992; 0 0 1];
S_tritan = [1 0 0; 0 1 0; -0.86744736 1.86727089 0];

S_protan_rgb = Tinv * S_protan * T;
S_deutan_rgb = Tinv * S_deutan * T;
S_tritan_rgb = Tinv * S_tritan * T;

image_1d = reshape(image, [], 3);

protan_image_1d = image_1d * S_protan_rgb.';
deutan_image_1d = image_1d * S_deutan_rgb.';
tritan_image_1d = image_1d * S_tritan_rgb.';

protan_image = reshape(protan_image_1d, size(image));
deutan_image = reshape(deutan_image_1d, size(image));
tritan_image = reshape(tritan_image_1d, size(image));

figure;
subplot(2, 2, 1); imshow(image); title('Original');
subplot(2, 2, 2); imshow(protan_image); title('Protanopia');
subplot(2, 2, 3); imshow(deutan_image); title('Deuteranopia');
subplot(2, 2, 4); imshow(tritan_image); title('Tritanopia');
