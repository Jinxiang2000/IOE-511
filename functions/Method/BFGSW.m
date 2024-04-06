% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% 
%           Inputs: x, f, g, problem, method, options
%           Outputs: x_new, f_new, g_new, H_new
%
function [x_new,f_new,g_new,H_new] = BFGSW(x,g,H,problem,method,options) 
  d = -H * g;
  
  % determine step size
  alpha_0 = method.options.alpha_0;
  c_1_ls = method.options.c_1_ls;
  c_2_ls = method.options.c_2_ls;
  alpha = Wolfe(x, g, alpha_0, c_1_ls, c_2_ls, d, problem);
  
  x_new = x + alpha * d;
  g_new = problem.compute_g(x_new, problem);
  f_new = problem.compute_f(x_new, problem);
  s_k = x_new - x;
  y_k = g_new - g;

  % Check the condition to skip the update
  if (s_k' * y_k) < options.term_tol * norm(s_k) * norm(y_k)
     % Skip the update
     H_new = H;
  else
     % BFGS update
     rho = 1 / (y_k' * s_k);
     V = eye(length(x)) - rho * (s_k * y_k');
     H_new = V' * H * V + rho * (s_k * s_k');
  end
end