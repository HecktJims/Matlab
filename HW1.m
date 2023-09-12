clear;
close all;

d = 1;
k = 8.987e9;
q = 1.602e-19;
A = [0. 0. d/2];
B = [0. 0. -d/2];

ini = ([0:13] - 6) * d / 2;
pos = [0. 0. 0.];
z = [0 0 1];

figure(1)
for i = 1:13
    for j = 1:13
        pos(1) = ini(i);
        pos(3) = ini(j);
        a = pos - A;
        b = pos - B;
        a_val = norm(a);
        b_val = norm(b);
        
        if or(a_val==0, b_val==0)
            E0 = [0. 0. 0.];
        else
            E0 = a / a_val.^3 - b / b_val.^3;
        end
        E = E0 * k * q;
        quiver(pos(1) / d, pos(3) / d, E(1), E(3), 'AutoScale', 'off');
        view(0, 90);
        
        j = j + 1;
    end
    i = i + 1;
end
