function [result] = is_square(A)
%IS_SQUARE Finds if a given matrix is square
%   [result] = IS_SQUARE(A) where A is a matrix
%   result represents the truth value of the function
%   Must return 1(TRUE) if the matrix is square
%   Must return 0(FALSE) otherwise
%
%   Author: Raúl Mínguez Rodríguez
%   Date: 13/10/2019

[rows, columns] = size(A);
result = rows == columns;

end

