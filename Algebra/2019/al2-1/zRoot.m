function [raices] = zRoot(z, n)
modulo = abs(z);
angulo = angle(z);
s = modulo ^ (1 / n);
beta = angulo / n;
for k = 1:n
    alfaK = beta + 2 * (pi / n) * (k - 1);
    raices{k} = s * exp (alfaK * i);
end
