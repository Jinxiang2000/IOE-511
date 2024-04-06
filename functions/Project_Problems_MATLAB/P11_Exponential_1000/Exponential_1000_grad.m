% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Problem Number: 11
% Problem Name: Exponential_1000:
% Problem Description: Exponential. Dimension n = 1000

%           Input: x
%           Output: g = nabla f(x)
%
function [g] = Exponential_1000_grad(x, ~)
    % Preallocate the gradient vector with zeros
    n = length(x); % Size of x
    g = zeros(n, 1); % Initialize gradient vector

    z1 = x(1);
    g(1) = (2 * exp(z1)) / ((exp(z1) + 1)^2) - 0.1 * exp(-z1);
    
    % Compute the gradient for z2 to zn
    for i = 2:n
        g(i) = 4 * (x(i) - 1)^3;
    end
end