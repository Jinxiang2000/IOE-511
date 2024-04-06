% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Problem Number: 8
% Problem Name: Rosenbrock_100
% Problem Description: Rosenbrock. Dimension n = 100

% Function that computes the gradient of the Rosenbrock function
%
%           Input: x
%           Output: g = nabla f(x)
%
function [g] = Rosenbrock_100_grad(x,~)
    g = zeros(100, 1);
    for i = 1:99
        g(i) = g(i) - 2*(1 - x(i)) - 400*(x(i+1) - x(i)^2)*x(i);
        g(i+1) = g(i+1) + 200*(x(i+1) - x(i)^2);
    end
end