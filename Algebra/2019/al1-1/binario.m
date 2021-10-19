function [maxNum] = binario(nBits)
maxNum=0;
for i=1:nBits
    maxNum=maxNum+2^(i-1);
end