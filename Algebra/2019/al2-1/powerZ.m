function [zPower] = powerZ(z, n)
[modulo, angulo] = complejo(z);
mZPower = modulo ^ n; %Modulo de zPower
aZPower = angulo * n; %Angulo de zPower
zPower = mZPower * exp(aZPower);