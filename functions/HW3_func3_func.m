% Function that computes the function value for the Rosenbrock function
%
%           Input: x
%           Output: f(x)
%
function [f] = HW3_func3_func(x, ~)
    % Extract z1 from x
    z1 = x(1);
    zi = x(2:end);
    
    % Calculate the first part of the function involving z1
    f = (exp(z1) - 1) / (exp(z1) + 1) + 0.1 * exp(-z1) + sum((zi - 1).^4);
end
