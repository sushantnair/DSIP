% Define the range of n
n = -10:10;

% Define the unit step function
u = @(n) double(n >= 0);

% Define the signal x(n)
x = @(n) 8*(0.5).^n .* (u(n+1) - u(n-3));

% Define the signals Y(n), F(n), and G(n)
Y = @(n) x(n-3);
F = @(n) x(n+1);
G = @(n) x(-n+4);

% Plot the signals
figure;
subplot(2,2,1);
stem(n, x(n));
title('x(n)');

subplot(2,2,2);
stem(n, Y(n));
title('Y(n) = x(n-3)');

subplot(2,2,3);
stem(n, F(n));
title('F(n) = x(n+1)');

subplot(2,2,4);
stem(n, G(n));
title('G(n) = x(-n+4)');
