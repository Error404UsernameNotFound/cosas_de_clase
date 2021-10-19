function [L] = lower_values(A)
%LOWER_VALUES Returns a matrix with the lower values of a given one
%   [L] = LOWER_VALUES(A) where A is a square matrix
%   L represents the lower values of matrix A
%
%   Author: Raúl Mínguez Rodríguez
%   Date: 15/10/2019

if (~is_square(A))
    %This exits the function if A is not square
    disp 'The given matrix is not square. To proceed, give a square matrix'

else
    mDimT = size(A);
    mDim = mDimT(1); %Obtains the size of matrix A
    L = zeros(mDim); %Creates a matrix of zeros of mDim size
    for row = 1:mDim
        for column = 1:mDim
            if column < row
                %Fills the lower values of L with those of A
                L(row, column) = A(row, column);
            end
        end
    end
        
end