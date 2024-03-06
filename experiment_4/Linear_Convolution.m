N1 = input('Enter the length of Input x(m): ');
N2 = input('Enter the length of Impulse Response h(m): ');
N = N1 + N2 - 1;
fprintf('\nThe length of Response v(m) will be %d.', N)
x = zeros(1, N1);
h = zeros(1, N2);

% Accepting x(m) and h(m)
for i = 1 : N1
    fprintf('\nEnter element %d of %d for x(m): ', i, N1)
    x(i) = input('');
end
% disp(x)
for i = 1 : N2
    fprintf('\nEnter element %d of %d for h(m): ', i, N2)
    h(i) = input('');
end
% disp(h)

%Accept start position of x(m) and h(m)
fprintf(['Enter the index (a number between %d and %d) of x(m) ' ...
    'from where 0 of x-axis starts: '], 1, N1)
x_start = input('');
% x_start
fprintf(['Enter the index (a number between %d and %d) of h(m) ' ...
    'from where 0 of x-axis starts: '], 1, N2)
h_start = input('');
% h_start

v_start = -(x_start + h_start - 2);
v_len = N;

X = zeros(1, v_len*2 + 1);
for i = 1 : N1
    X(1, i + v_len - x_start + 1) = x(i);
end
disp(X)

H = zeros(1, v_len*2 + 1);
for i = 1 : N2
    H(1, i + v_len - h_start + 1) = h(i);
end
disp(H)

% Folding
H = flip(H);
disp(H)

% Final table
table = zeros(v_len, v_len * 2 + 1);

% Row of table which is padded to the table after computation
row = H;
row = [row(1 - v_start:size(row, 2)), zeros(1, v_start + 2)];
disp(row)

% Shifting the consecutive rows
table(1, :) = row .* X;
for i = 2 : v_len
    row = [0, row(1 : size(row, 2) - 1)];
    disp(row);
    table(i, :) = row .* X;
end

table = sum(table, 2);
disp(table)
