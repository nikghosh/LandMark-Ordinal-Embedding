function [ y ] = log_logistic( x )
% log of logistic function
y = -log(1 + exp(-x));
end

