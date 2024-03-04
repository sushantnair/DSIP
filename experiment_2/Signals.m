%1) Unit Step
subplot(3, 3, 1)
a = zeros(1, 21);
for i = -10 : 1 : 10
    if i >= 0
        a(1, 10 + 1 + i) = 1;
    else
        a(1, 10 + 1 + i) = 0;
    end
end
stem(a)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 10)
title('Unit Step')

%2) Impulse
subplot(3, 3, 2)
b = zeros(1, 21);
for i = -10 : 1 : 10
    if i == 1
        b(1, 10 + i) = 1;
    else
        b(1, 10 + 1 + i) = 0;
    end
end
stem(b)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 10)
title('Impulse')

%3) Ramp
subplot(3,3,3)
c = zeros(1, 21);
for i = -10 : 1 : 10
    if i >= 0
        c(1, 10 + 1 + i) = i;
    else
        c(1, 10 + 1 + i) = 0;
    end
end
stem(c)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 10)
title('Ramp')

%4) Increasing Exponential
subplot(3,3,4)
a = 2;
d = zeros(1, 11);
d(1, 1) = a .^ 0;
for i = 2 : 11
    d(1, i) = a .^ (i - 1);
end
stem(d)
% Shift the origin of the x-axis
xlim([1, 11]);
xlabel('time')
ylabel('amplitude')
title('Increasing Exponential')

%5) Decaying Exponential
subplot(3,3,5)
a = 0.5;
e = zeros(1, 11);
e(1, 1) = a .^ 0;
for i = 2 : 11
    e(1, i) = a .^ (i - 1);
end
stem(e)
% Shift the origin of the x-axis
xlim([1, 11]);
xlabel('time')
ylabel('amplitude')
title('Decaying Exponential')

%6) Sine wave
subplot(3,3,6)
f = zeros(1, 101); % Initialize array with 101 elements
for i = -10 : 0.2 : 10 % Loop from -10 to 10 with a step size of 0.2
    f(1, round(i*5 + 51)) = sin(i); % Multiply i by 5 and add 51 to get the index from 1 to 101
end
stem(f)
xlabel('time')
ylabel('amplitude')
title('Sine Wave')
xt = get(gca, 'XTick'); % Get the current x-axis tick values
set(gca, 'XTick', xt, 'XTickLabel', round((xt - 51)/5)) % Set the x-axis tick labels to the original time values

%7) Cosine wave
subplot(3,3,7)
f = zeros(1, 101); % Initialize array with 101 elements
for i = -10 : 0.2 : 10 % Loop from -10 to 10 with a step size of 0.2
    f(1, round(i*5 + 51)) = cos(i); % Multiply i by 5 and add 51 to get the index from 1 to 101
end
stem(f)
xlabel('time')
ylabel('amplitude')
title('Cosine Wave')
xt = get(gca, 'XTick'); % Get the current x-axis tick values
set(gca, 'XTick', xt, 'XTickLabel', round((xt - 51)/5)) % Set the x-axis tick labels to the original time values
