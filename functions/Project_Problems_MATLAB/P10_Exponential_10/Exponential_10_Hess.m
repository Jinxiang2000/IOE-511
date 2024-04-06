% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Problem Number: 10
% Problem Name: Exponential_10:
% Problem Description: Exponential. Dimension n = 10

%           Input: x
%           Output: H = nabla^2 f(x)
%
function [H] = Exponential_10_Hess(x, ~)
    % Size of x
    n = length(x);
    
    % Initialize Hessian matrix with zeros
    H = zeros(n, n);
    
    % Compute the second-order partial derivative for z1
    z1 = x(1);
    H(1, 1) = (2 * exp(z1) * (1 - exp(z1))) / ((exp(z1) + 1)^3) + 0.1 * exp(-z1);
    
    % Compute the second-order partial derivatives for z2 to zn
    for i = 2:n
        H(i, i) = 12 * (x(i) - 1)^2;
    end
end