% MaxDeux.m
%
% Maximum d'une matrice et indices


function [ m , i , j ] = MaxDeux(Mat)

[ M , I ] = max(Mat);
[ m , j ] = max(M);
i = I(j);

