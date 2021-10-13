%Ejercicio 1.
clear, clc;
syms f x y;
f = x^2 + y^2;

%%

%Ejercicio 2.
syms a b; 
a = 1/4;
b = sqrt(2);

%%

%Ejercicio 3.
s = subs(f, {x, y}, {a, b})
%Sustituye, en f, x por a, et y por b.