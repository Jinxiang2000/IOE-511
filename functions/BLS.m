% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Performs backtracking line search to find a step size that satisfies the Armijo condition.
%
% Inputs:
%   x - Current point as a column vector.
%   grad_f - Current gradient of the objective function at x.
%   alpha_0 - Initial step size (scalar).
%   tau - Reduction factor (scalar, 0 < tau < 1), used to reduce step size.
%   c1 - Armijo constant (scalar, 0 < c1 < 1), controls the sufficient decrease condition.
%   d - Descent direction (column vector), direction along which to search for a step size.
%   problem
%
% Outputs:
%   alpha - Step size that satisfies the Armijo condition.

function [alpha] = BLS(x, g, alpha_0, tau, c_1_ls, d, problem)
  alpha = alpha_0;
  f = problem.compute_f(x, problem);
  grad_f_dot_d = g' * d;
  while problem.compute_f(x + alpha * d, problem) > f + c_1_ls * alpha * grad_f_dot_d;
      alpha = tau * alpha;  % Reduce alpha
  end
end