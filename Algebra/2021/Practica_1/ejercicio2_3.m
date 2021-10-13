%Ejercicio 1.
z = -1i;
zmod = abs(z)
zarg = angle(z)

%Ejercicio 2.
w0 = nthroot(zmod, 3) * exp((1i * (zarg + 2*0*pi)) / 3)
w1 = nthroot(zmod, 3) * exp((1i * (zarg + 2*1*pi)) / 3)
w2 = nthroot(zmod, 3) * exp((1i * (zarg + 2*2*pi)) / 3)

%Ejercicio 3.
plot([w0, w1, w2, w0], 'k')
hold on
plot([w0, w1, w2], '*r')
ezplot('x^2 + y^2 - 1', [-1, 1, -1, 1]) %#ok<*EZPLT>