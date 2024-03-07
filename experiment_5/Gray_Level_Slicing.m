a = imread("skull.png");

subplot(1, 3, 1);
imshow(a);
title('Original')

[row, col] = size(a);

b = a;

TL = input('Enter the lower threshold value (between 0 to 255): ');
TU = input('Enter the upper threshold value (between 0 to 255): ');

for i = 1 : 1 : row
    for j = 1 : 1 : col
        if (a(i,j) >= TL && a(i,j) <= TU)
            b(i,j) = 255;
        else
            b(i,j) = 0;
        end
    end
end

subplot(1, 3, 2);
imshow(b);
title('Gray Level W/O Background')

[row, col] = size(a);
c = a;

for i = 1 : 1 : row
    for j = 1 : 1 : col
        if (a(i,j) >= TL && a(i,j) <= TU)
            c(i,j) = 255;
        else
            c(i,j) = a(i,j);
        end
    end
end

subplot(1, 3, 3);
imshow(c);
title('Gray Level W Background')
