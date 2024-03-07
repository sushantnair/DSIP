a = imread("cameraman.png");
% a = rgb2gray(a);

subplot(3, 3, 1);
imshow(a);
title('Original')

b = [];
c = [];
d = [];
e = [];
f = [];
g = [];
h = [];
i = [];

for m = 1 : 256
    for n = 1 : 256
        p = de2bi(a(m,n), 8, 'left-msb');
        b(m,n) = p(1,1);
        c(m,n) = p(1,2);
        d(m,n) = p(1,3);
        e(m,n) = p(1,4);
        f(m,n) = p(1,5);
        g(m,n) = p(1,6);
        h(m,n) = p(1,7);
        i(m,n) = p(1,8);
    end
end

subplot(3, 3, 2);
imshow(i);
title('Bit Plane 1 (Bit 0)')

subplot(3, 3, 3);
imshow(h);
title('Bit Plane 2 (Bit 1)')

subplot(3, 3, 4);
imshow(g);
title('Bit Plane 3 (Bit 2)')

subplot(3, 3, 5);
imshow(f);
title('Bit Plane 4 (Bit 3)')

subplot(3, 3, 6);
imshow(e);
title('Bit Plane 5 (Bit 4)')

subplot(3, 3, 7);
imshow(d);
title('Bit Plane 6 (Bit 5)')

subplot(3, 3, 8);
imshow(c);
title('Bit Plane 7 (Bit 6)')

subplot(3, 3, 9);
imshow(b);
title('Bit Plane 8 (Bit 7)')
