function [modulo, angulo] = complejo(z)
a = real(z);
b = imag(z);
modulo = sqrt(a^2 + b^2);
angulo = atan(b / a) * (180 / pi);