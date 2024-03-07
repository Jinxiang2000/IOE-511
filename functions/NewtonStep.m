% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Function that: (1) computes the GD step; (2) updates the iterate; and, 
%                (3) computes the function and gradient at the new iterate
% 
%           Inputs: x, f, g, problem, method, options
%           Outputs: x_new, f_new, g_new, alpha
%
function [x_new,f_new,g_new,H_new,alpha] = NewtonStep(x,g,H,problem,method) 
  % search direction is -H\g
  d = -H\g;

  % determine step size
  alpha_0 = method.options.alpha_0;
  tau = method.options.tau; 
  c_1_ls = method.options.c_1_ls;
  switch method.options.step_type
      case 'Backtracking'
          alpha = BLS(x, g, alpha_0, tau, c_1_ls, d, problem);
      case 'Wolfe'
          c_2_ls = method.options.c_2_ls;
          alpha = Wolfe(x, g, alpha_0, tau, c_1_ls, c_2_ls, d, problem);
      otherwise
          error('step type not defined!!!');    
  end
  
  x_new = x + alpha * d;
  f_new = problem.compute_f(x_new, problem);
  g_new = problem.compute_g(x_new, problem);
  H_new = problem.compute_H(x_new, problem);

  
end

