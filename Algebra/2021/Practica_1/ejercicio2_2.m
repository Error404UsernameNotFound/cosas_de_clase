%Ejercicio 1.
z = 1 + 1i
w = 1 - sqrt(3)*1i

zmod = abs(z)
zarg = angle(z)

wmod = abs(w)
warg = angle(w)

%Ejercicio 2.
zw = (zmod^4 * exp(zarg*4*1i)) * (wmod^2 * exp(warg*2*1i))
zw2 = zmod^4 * wmod^2 * exp(zarg*4*1i + warg*2*1i)