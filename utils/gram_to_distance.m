function [ D ] = gram_to_distance( G )
% Converts gram matrix G to distance matrix D
n = size(G, 1);
g = diag(G);
e = ones(n, 1);
D = g * e' + e * g' - 2*G;
end

