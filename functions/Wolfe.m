% Performs Weak wolfe line search 
%
% Inputs:
%   x - Current point as a column vector.
%   grad - Current gradient of the objective function at x.
%   alpha_0 - Initial step size (scalar).
%   c_1_ls, c_2_ls - Wolfe's condition constants with 0 < c1 < c2 < 1
%   d - Descent direction (column vector)
%
% Outputs:
%   alpha - Step size that satisfies the Wolfe's condition.

function [alpha] = Wolfe(x, g, alpha_0, c_1_ls, c_2_ls, d, problem)
  c = 0.5;
  alpha_low = 0;
  alpha_high = 1000;  % Default high value for alpha
  alpha = alpha_0;
  f = problem.compute_f(x, problem);
  grad_f_dot_d = g' * d;
  t = 0;

  while true
      t = t + 1;
      f_trial = problem.compute_f(x + alpha * d, problem);
      if f_trial <= f + c_1_ls * alpha * grad_f_dot_d
          grad_g_trial = problem.compute_g(x + alpha * d, problem);
          if grad_g_trial' * d >= c_2_ls * grad_f_dot_d
              % Wolfe conditions satisfied
              break;
          end
      end

      if f_trial <= f + c_1_ls * alpha * grad_f_dot_d
          alpha_low = alpha;
      else
          alpha_high = alpha;
      end

      alpha = c * alpha_low + (1 - c) * alpha_high;
      %fprintf('Current alpha: %.4f\n', alpha);

      if t > 1e3  % Set a maximum number of iterations
          warning('Wolfe:MaxIterations', 'Maximum iterations exceeded in Wolfe line search.');
          break;
      end
  end
end