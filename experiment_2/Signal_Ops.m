% Define the range of random integers
min_value = 5;
max_value = 15;

% Figure 1 for Signal Addition
% Signal 1
figure;
subplot(3, 1, 1)
b = zeros(1, 21);
for i = -10 : 1 : 10
    % Generate a random integer within the specified range
    rand_amp = randi([min_value, max_value]);
    b(1, 10 + 1 + i) = rand_amp;
end
stem(b)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 10)
ylim([0, 30]);
title('Signal 1')

% Signal 2
subplot(3, 1, 2)
c = zeros(1, 21);
for i = -10 : 1 : 10
    % Generate a random integer within the specified range
    rand_amp = randi([min_value, max_value]);
    c(1, 10 + 1 + i) = rand_amp;
end
stem(c)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 10)
ylim([0, 30]);
title('Signal 2')

% Add the two signals
subplot(3, 1, 3)
combined_signal = b + c;
stem(combined_signal)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 10)
title('Addition of Signal')

% Figure 2 for Signal Subtraction
figure;
% Signal 1
subplot(3, 1, 1)
stem(b)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 10)
ylim([0, 30]);
title('Signal 1')

% Signal 2
subplot(3, 1, 2)
stem(c)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 10)
ylim([0, 30]);
title('Signal 2')

% Subtract the two signals
subplot(3, 1, 3)
combined_signal = b - c;
stem(combined_signal)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 10)
title('Subtraction of Signal')

% Figure 3 for Signal Multiplication
figure;
% Signal 1
subplot(3, 1, 1)
stem(b)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 10)
ylim([0, 30]);
title('Signal 1')

% Signal 2
subplot(3, 1, 2)
stem(c)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 10)
ylim([0, 30]);
title('Signal 2')

% Multiply the two signals
subplot(3, 1, 3)
combined_signal = b .* c;
stem(combined_signal)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 10)
title('Multiplication of Signal')

% Figure 4 for Signal Upsampling and Downsampling
figure;
subplot(3, 1, 1)
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

subplot(3, 1, 2)
% Upsampling by a factor of 2
c_upsampled = zeros(1, 2 * length(c));
for i = 1:length(c)
    c_upsampled(2*i - 1) = c(i);
end
stem(c_upsampled)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 20)
ylim([0, 10]);
title('Upsampled Ramp Signal')

subplot(3, 1, 3)
% Downsampling by a factor of 2
c_downsampled = zeros(1, ceil(length(c)/2));
for i = 1:ceil(length(c)/2)
    c_downsampled(i) = c(2*i - 1);
end
stem(c_downsampled)
xlabel('time')
ylabel('amplitude')
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 5)
ylim([0, 10]);
title('Downsampled Ramp Signal')

% Figure 5 for Signal Shift Operation (Delay & Advance)
% Generate signal
figure;
subplot(3, 1, 1)
d = zeros(1, 7);
d(1, 3) = 3;
d(1, 4) = 2;
d(1, 5) = 1;
stem(d)
xlabel('n')
ylabel('X(n)')
% Modify x-axis to display all integer values
xticks(0:1:7)
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 1)
title('Original Signal')

% Create delayed signal
subplot(3, 1, 2)
d_delay = zeros(1, 7); % Initialize d_delay with zeros
for i = 3 : 1 : 7
    d_delay(i) = d(i-2); % Shift d by 2 units to the right
end
stem(d_delay)
xlabel('n')
ylabel('X(n)')
% Modify x-axis to display all integer values
xticks(0:1:7) 
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 1)
title('Signal Delayed by 2 units')

% Create advanced signal
subplot(3, 1, 3)
d_advanced = zeros(1, 7); % Initialize d_advanced with zeros
for i = 1 : 1 : 5
    d_advanced(i) = d(i+2); % Shift d by 2 units to the left
end
stem(d_advanced)
xlabel('n')
ylabel('X(n)')
% Modify x-axis to display all integer values
xticks(0:1:7) 
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt - 1)
title('Signal Advanced by 2 units')
