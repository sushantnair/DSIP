a = imread("tumor.png");

subplot(1, 2, 1);
imshow(a);
title('Original')

[r, c] = size(a);

b = a;

T = input('Enter the threshold value (between 0 to 255): ');

for i = 1 : 1 : r
    for j = 1 : 1 : c
        if(a(i, j) < T)
            b(i, j) = 0;
        else
            b(i, j) = 255;
        end
    end

end

subplot(1, 2, 2);
imshow(b);
title('Thresholding')
