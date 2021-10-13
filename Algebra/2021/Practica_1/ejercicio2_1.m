%Ejercicio 1.
%pi = sym(pi)
%clear all

z = ((1 - exp(pi*1i) / 2)) / ((1 + exp(pi*1i) / 2))
w = exp(pi*1i) * (1 - exp((-pi*1i) / 3))

%Ejercicio 2.
u = (z + w) / 2*1i + 1/2
real(u)
imag(u)