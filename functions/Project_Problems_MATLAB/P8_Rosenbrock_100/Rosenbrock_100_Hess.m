% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Problem Number: 8
% Problem Name: Rosenbrock_100
% Problem Description: Rosenbrock. Dimension n = 100


% Function that computes the Hessian of the Rosenbrock function
%
%           Input: x
%           Output: H = nabla^2 f(x)
%
function [H] = Rosenbrock_100_Hess(x, ~)
    n = 100;
    H = zeros(n, n);

    % Compute the Hessian
    for i = 1:(n-1)
        H(i, i) = 2 - 400*(x(i+1) - 3*x(i)^2);
        H(i, i+1) = -400*x(i);
        H(i+1, i) = H(i, i+1); % Since the Hessian is symmetric

    end

    % For elements involving the interaction between x_i and x_(i+1)
    for i = 2:n
        H(i, i) = H(i, i) + 200;

    end
end


