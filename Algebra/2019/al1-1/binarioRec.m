function [maxNum] = binarioRec(nBits)
if nBits==1
    maxNum=nBits;
else
    maxNum=2^(nBits-1)+binarioRec(nBits-1);
end