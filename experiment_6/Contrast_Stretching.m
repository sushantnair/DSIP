a = imread("stairwell.png");

b = a * 0.4;

c = a * 3;

subplot(1, 3, 1)
imshow(a)
title('Original Image')

subplot(1, 3, 2)
imshow(b)
title('Decreased Contrast')

subplot(1, 3, 3)
imshow(c)
title('Increased Contrast')
