function [sol, nulA] = solveSCD(A, b) 
%SOLVESCD Returns the solutions of matrix A with respect to b, assuming the
%system has only determined solutions and no null space
%   [sol, nulA] = SOLVESCD(A, b) where A is a matrix and b a column vector
%   sol represents the solutions of matrix A
%   nulA represents the null space of A
%
%   Author: Raúl Mínguez Rodríguez
%   Date: 02/11/2019

sol = A\b;
nulA = null(A);

end