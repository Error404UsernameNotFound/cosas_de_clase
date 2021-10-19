function [sol, nulA] = solveSCI(A, b) 
%SOLVEAB Returns the solutions of matrix A with respect to b, assuming the 
%system will have null space 
%   [sol, nulA] = SOLVEAB(A, b) where A is a matrix and b a column vector
%   sol represents the solutions of matrix A
%   nulA represents the null space of A
%
%   Author: Raúl Mínguez Rodríguez
%   Date: 02/11/2019

sol= A' * inv(A*A')*b;
% sol= A' * (A*A')\b;
nulA = null(A);

end