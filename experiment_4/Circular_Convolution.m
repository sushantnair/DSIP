fprintf('Maximum Sequence Length is 64.\n')
N1 = input('Enter the length of First Sequence x1(m): ');
N2 = input('Enter the length of Second  Sequence x2(m): ');
fprintf('Length of Result Sequence x3(m) is the same as the adjusted length')

max_l = max(N1, N2);
fprintf('\nMaximum length is %d\n', max_l)
% Assuming that the entered lengths are not in power of 2
flag = 0;
% Checking if the maximum length is a power of 2
for i = 1 : 6
    pow = 2 ^ i;
    % disp(pow)
    if max_l == pow
        fprintf('\nMaximum length is a power of 2')
        flag = 1; 
        break
    end
end
if flag == 0
    % There is a need to pad zeroes
    new_max_l = 2 ^ nextpow2(max_l);
    fprintf('\nNew maximum length is %d\n', new_max_l)
else
    % No need to pad zeroes 
    new_max_l = max_l;
end

x1 = zeros(1, new_max_l);
x2 = zeros(1, new_max_l);

% Accepting x1(m) and x2(m)
for i = 1 : N1
    fprintf('\nEnter element %d of %d for x1(m): ', i, N1)
    x1(i) = input('');
end
for i = 1 : N2
    fprintf('\nEnter element %d of %d for x2(m): ', i, N2)
    x2(i) = input('');
end

% Zero-padding
for i = N1 + 1 : new_max_l
    x1(i) = 0;
end
for i = N2 + 1 : new_max_l
    x2(i) = 0;
end

disp(x1)
disp(x2)

%Accept start position of x1(m) and x2(m)
fprintf(['Enter the index (a number between %d and %d) of x1(m) ' ...
    'from where 0 of x-axis starts: '], 1, N1)
x1_start = input('');
% x_start
fprintf(['Enter the index (a number between %d and %d) of x2(m) ' ...
    'from where 0 of x-axis starts: '], 1, N2)
x2_start = input('');
% h_start

X1 = zeros(1, new_max_l*2 - 1);
for i = 1 : N1
    X1(1, i + new_max_l - x1_start -1) = x1(i);
end
disp(X1)

X2 = zeros(1, new_max_l*2 - 1);
for i = 1 : N2
    X2(1, i + new_max_l - x2_start -1) = x2(i);
end
disp(X2)

% Folding and Mirroring
X2 = flip(X2);
centrenum = round(numel(X2)/2);
leftmostn = X2(1 : centrenum - 1);
X2(centrenum + 1:length(X2)) = leftmostn;
disp(X2)

% Final table
table = zeros(new_max_l, new_max_l * 2 - 1);

% Row of table which is padded to the table after computation
row = X2;
row = [row(1 - x1_start:size(row, 2)), zeros(1, x1_start)];
% disp(row)

% Shifting the consecutive rows
table(1, :) = row .* X1;
for i = 2 : new_max_l
    row = [0, row(1 : size(row, 2) - 1)];
    disp(row);
    table(i, :) = row .* X1;
end

table = sum(table, 2);
disp(table)
