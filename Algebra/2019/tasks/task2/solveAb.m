function [sol, nulA] = solveAb(A, b) 
%SOLVEAB Returns the solutions of matrix A with respect to b
%   [sol, nulA] = SOLVEAB(A, b) where A is a matrix and b a column vector
%   sol represents the solutions of matrix A, column vector of numbers
%   nulA represents the null space of A, matrix whose columns are those
%   that define the null space
%
%   Author: Raúl Mínguez Rodríguez
%   Date: 02/11/2019

M = [A, b];
[~, columns] = size(A);

if rank(M) == rank(A) && rank(M) == columns %SCD
    [sol, nulA] = solveSCD(A, b);
    if (A*sol - b) < 0.00005
        disp('Sistema compatible determinado');
    end
    
    
elseif rank(M) == rank(A) && rank(M) < columns %SCI
    [sol, nulA] = solveSCI(A, b);  
    if (A*sol - b) < 0.00005
        disp('Sistema compatible indeterminado');
    end
    
else %SI         
    [sol, nulA] = solveSI(A, b);  
    if ~((A*sol - b) < 0.00005)
        disp('Sistema incompatible');
    end
    
end

end