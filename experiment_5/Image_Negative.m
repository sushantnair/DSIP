a = imread("cameraman.png");

subplot(1, 2, 1);
imshow(a);
title('Original')

b = 255 - a;
% L = 256; z = L - 1 - r

subplot(1, 2, 2);
imshow(b);
title('Image Negative')
