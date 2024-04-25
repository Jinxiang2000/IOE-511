% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Problem Number: 11
% Problem Name: Exponential_1000:
% Problem Description: Exponential. Dimension n = 1000

%           Input: x
%           Output: f(x)
%
function [f] = Exponential_1000_func(x, ~)
    % Extract z1 from x
    z1 = x(1);
    zi = x(2:end);
    
    % Calculate the first part of the function involving z1
    f = (exp(z1) - 1) / (exp(z1) + 1) + 0.1 * exp(-z1) + sum((zi - 1).^4);
end