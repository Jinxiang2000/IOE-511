% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Problem Number: 7
% Problem Name: Rosenbrock_2
% Problem Description: Rosenbrock. Dimension n = 2

% Function that computes the Hessian of the Rosenbrock function
%
%           Input: x
%           Output: H = nabla^2 f(x)
%
function [H] = Rosenbrock_2_Hess(x, ~)
  H = [1200 * x(1)^2 - 400 * x(2) + 2, -400 * x(1);
       -400 * x(1), 200];
end