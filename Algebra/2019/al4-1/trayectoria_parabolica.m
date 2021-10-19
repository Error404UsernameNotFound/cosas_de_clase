%Generacion de datos sinteticos
x0 = 0;
v0 = 500;
g = 9.8;
t = [1:0.5:15];
x = x0 + v0*t - 0.5*g*t.^2;
noise = 0.01; %Porcentaje de ruido, ajustable aqui
mu0 = 0.8;
xr = x + noise*mean(x)*randn(1, length(x)) + mu0; %A x le añado ruido
%Generacion de ruido que sigue una gaussiana, de media mu0 y desv. tip.
%noise*mean(x)
plot(t, xr, 'k-o')
xlabel('t(s)')
ylabel('x(m)')
hold on
grid on

%Ajuste por minimos cuadrados
ndata = length(x);
t2 = t.^2;
A = [ones(ndata, 1), t(:), t2(:)];
param = inv(A'*A)*A'*xr(:);
%
xop = param(1);
vop = param(2);
gp = -2*param(3);


%Prediccion de la caida
tn = t(end);
xn = x(end);
step = 1;
while xn > 0
    tn = tn + step;
    xn = xop + vop*tn - 0.5*gp*tn^2;
    plot(tn, xn, 'm.');
    pause(0.1)
end