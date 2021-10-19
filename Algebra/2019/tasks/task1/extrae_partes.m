function [D, L, U] = extrae_partes(A)
%EXTRAE_PARTES Returns the parts of a given square matrix
%   [D, L, U] = EXTRAE_PARTES(A) where A is a square matrix
%   D represents the main diagonal of matrix A
%   L represents the lower triangle of matrix A
%   U represents the upper triangle of matrix A
%
%   Author: Raúl Mínguez Rodríguez
%   Date: 13/10/2019

if (~is_square(A))
    %This exits the function if A is not square
    disp 'The given matrix is not square; to proceed, give a square matrix'
    
else
    D = diagonal_values(A);
    L = lower_values(A);
    U = upper_values(A);

end

