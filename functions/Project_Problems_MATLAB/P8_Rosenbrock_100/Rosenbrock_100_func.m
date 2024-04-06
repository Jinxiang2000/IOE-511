% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Problem Number: 8
% Problem Name: Rosenbrock_100
% Problem Description: Rosenbrock. Dimension n = 100

% Function that computes the function value for the Rosenbrock function
%
%           Input: x
%           Output: f(x)
%
function [f] = Rosenbrock_100_func(x, ~)
    % Initialize the function value to 0
    f = 0;
    
    % Sum over the 99 terms of the function
    for i = 1:99
        f = f + (1 - x(i))^2 + 100 * (x(i+1) - x(i)^2)^2;
    end
end