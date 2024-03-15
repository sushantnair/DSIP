a = imread('Einstein-image-before.png');

b = zeros(1, 256);

[row, col] = size(a);

disp(size(a))

for i = 1 : 1 : row
    for j = 1 : 1 : col
           fprintf("%d ", a(i,j))
           for k = 1 : 256
               if a(i,j) == k
                   b(k) = b(k) + 1;
               end
           end
    end
    fprintf("\n")
end

fprintf("\nNumber of Pixels for Each Pixel Value (0 to 255) in Original Image\n")
disp(b)

c = zeros(1, 256);

for l = 1 : 256
    for m = 1 : l
        c(l) = c(l) + b(m);
    end
end

fprintf('\nRunning Sum:\n')
disp(c)

d = c(256);

fprintf('\nTotal Number of Pixels: %d', d)

e = zeros(1, 256);

for n = 1 : 256
    e(n) = c(n) / d;
end

fprintf('\nRunning Sum / Total Number of Pixels:\n')
disp(e)

f = zeros(1, 256);

for o = 1 : 256
    f(o) = e(o) * 255;
    f(o) = floor(f(o));
end

fprintf('\nMultiply with Maximum Gray Level:\n')
disp(f)

g = a;

fprintf("\nMapping of Gray Level by a One to One Correspondence\n")
fprintf("\n| OLD || NEW |\n+-----++-----+")
for iter = 1 : 256
    fprintf("\n|  %d  ||  %d  |", iter, f(iter))
end
fprintf("\n+-------++-------+")

h = zeros(1, 256);

for p = 1 : 1 : row
    for q = 1 : 1 : col
        for r = 1 : 256
            if a(p, q) == r
                g(p, q) = f(r);
            end
            if g(p, q) == r
                h(r) = h(r) + 1;
            end
        end
    end
end

fprintf("\nNumber of Pixels for Each Pixel Value (0 to 255) in Histogram Equalized Image\n")
disp(h)

subplot(2, 2, 1)
imshow(a)

subplot(2, 2, 2)
stem(b)
xlabel('Pixel Value')
ylabel('Number of Pixels')
title('Histogram')

subplot(2, 2, 3)
imshow(g)

subplot(2, 2, 4)
stem(h)
xlabel('Pixel Value')
ylabel('Number of Pixels')
title('Equalized Histogram')
