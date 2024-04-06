% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Problem Number: 7
% Problem Name: Rosenbrock_2
% Problem Description: Rosenbrock. Dimension n = 2

% Function that computes the gradient of the Rosenbrock function
%
%           Input: x
%           Output: g = nabla f(x)
%
function [g] = Rosenbrock_2_grad(x,~)
    g = [400 * x(1) * (x(1)^2 - x(2)) + 2 * x(1) - 2; 
            -200 * (x(1)^2 - x(2))];
end