% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Problem Number: 4
% Problem Name: quad_1000_1000
% Problem Description: A randomly generated convex quadratic function; the 
%                      random seed is set so that the results are 
%                      reproducable. Dimension n = 1000; Condition number
%                      kappa = 1000

% function that computes the function value of the quad_1000_1000 function
function [g] = quad_1000_1000_grad(x, ~)
persistent Q flag
% Set random number generator seeds
rng(0);

% Generate random data
q = randn(1000,1);
% MATLAB sprandsym function. Inputs: n, density, reciprocal of the 
% condition number, and kind 
% (see https://www.mathworks.com/help/matlab/ref/sprandsym.html)
if isempty(flag)
    Q = sprandsym(1000,0.5,1e-3,1);
    flag = 1;
end

% compute function value
g = Q*x + q;

end