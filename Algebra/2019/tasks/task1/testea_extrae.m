x = input('Introduzca tamaño de la matriz deseada:');
A = rand(x);
[D, L, U] = extrae_partes(A);

fprintf('Matriz original (%d x %d)\n\n', x, x);
disp(A)

pause();

fprintf('Valores de la diagonal\n\n');
disp(D)

pause();

fprintf('Valores inferiores\n\n');
disp(L)

pause();

fprintf('Valores superiores\n\n');
disp(U)

pause();

clear x A D L U
clc