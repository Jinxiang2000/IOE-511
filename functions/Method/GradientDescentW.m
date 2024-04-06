% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Function that: (1) computes the GD step (Wolfe); (2) updates the iterate; and, 
%                (3) computes the function and gradient at the new iterate
% 
%           Inputs: x, g, problem, method
%           Outputs: x_new, f_new, g_new
%
function [x_new,f_new,g_new] = GradientDescentW(x,g,problem,method)
  % search direction is -g
  d = -g;
  
  % determine step size
  alpha_0 = method.options.alpha_0;
  c_1_ls = method.options.c_1_ls;
  c_2_ls = method.options.c_2_ls;
  alpha = Wolfe(x, g, alpha_0, c_1_ls, c_2_ls, d, problem);

  x_new = x + alpha * d;
  f_new = problem.compute_f(x_new, problem);
  g_new = problem.compute_g(x_new, problem);
end