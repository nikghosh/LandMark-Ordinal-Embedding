function [ y ] = sigmoid( x )
% Sigmoid function S(x) = 1 / (1 + e^-x)
if x >= 0
    z = exp(-x);
    y = 1./(1 + z);
else
    z = exp(x);
    y = z./(1 + z);
end
end

