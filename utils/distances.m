function [ D ] = distances( X, i, j )
%DISTANCES Summary of this function goes here
%   Detailed explanation goes here
D = sum((X(i, :) - X(j, :)).^2, 2);
end

