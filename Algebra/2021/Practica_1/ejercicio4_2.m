syms x z
M = [1+x 1 1 1; 1 1-x 1 1; 1 1 1+z 1; 1 1 1 1-z]

%Sustituimos x por 5, y z por -17
N = subs(M, {x, z}, {5, -17})

%Calculamos el valor de x y z cuando el determinante de la matriz es 0
solve(det(M) == 0)