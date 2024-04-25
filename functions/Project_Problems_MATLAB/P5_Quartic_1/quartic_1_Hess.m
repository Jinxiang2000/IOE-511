% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Problem Number: 5
% Problem Name: quartic_1
% Problem Description: A quartic function. Dimension n = 4

% function that computes the Hessian of the quartic_1 function
function [H] = quartic_1_Hess(x, ~)

% Matrix Q
Q = [5 1 0 0.5;
     1 4 0.5 0;
     0 0.5 3 0;
     0.5 0 0 2];
 
% Set sigma value
sigma = 1e-4;


qx = Q*x;
H = eye(length(x)) + sigma * (2*(qx)*(qx)' + (x'*Q*x)*Q);

end