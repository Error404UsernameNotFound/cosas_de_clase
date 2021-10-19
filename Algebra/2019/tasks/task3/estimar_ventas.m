tiempo = [2007 2008 2009 2011 2012 2015];
ventas = [40010 45205 49823 54102 54200 54900];

plot(tiempo, ventas, 'k-o')
axis([2006 (tiempo(end) + 3)  (ventas(1) - 1000) (ventas(end) + 4000)])
xlabel('Tiempo (años)')
ylabel('Ventas (unidades)')
hold on
grid on

% Ajuste por minimos cuadrados
ndata = length(ventas);
tiempo2 = log10(tiempo);
M = [ones(ndata, 1), tiempo(:), tiempo2(:)];
params = inv(M'*M)*M'*ventas(:);

A = params(1);
B = params(2);
C = params(3);

tiempoComp = tiempo(1);
ventasAj = [];
tiempoAj = [];
step = 1;
while tiempoComp <= tiempo(end)
   ventasAj(end + 1) = A + B * tiempoComp + C * log10(tiempoComp);
   tiempoAj(end + 1) = tiempoComp;
   
   tiempoComp = tiempoComp + step;
end
plot(tiempoAj, ventasAj, 'r-'); 



%Prediccion de las ventas para 2016
ventas2016 = A + B * tiempoComp + C * log10(tiempoComp);
plot(tiempoComp, ventas2016, 'bx'); 


legend('Datos de ventas reales', 'Datos ajustados', 'Valor extrapolado')