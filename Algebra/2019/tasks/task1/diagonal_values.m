function [D] = diagonal_values(A)
%DIAGONAL_VALUES Returns a matrix with the diagonal values of a given one
%   [D] = DIAGONAL_VALUES(A) where A is a square matrix
%   D represents the main diagonal of matrix A
%
%   Author: Raúl Mínguez Rodríguez
%   Date: 13/10/2019

if (~is_square(A))
    %This exits the function if A is not square
    disp 'The given matrix is not square. To proceed, give a square matrix'

else
    mDimT = size(A);
    mDim = mDimT(1); %Obtains the size of matrix A
    D = zeros(mDim); %Creates a matrix of zeros of mDim size
    for row = 1:mDim
        for column = 1:mDim
            if row == column
                %Fills the diagonal values of D with those of A
                D(row, column) = A(row, column);
            end
        end
    end
        
end

