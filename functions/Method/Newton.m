% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

%           Inputs: x, f, g, problem, method, options
%           Outputs: x_new, f_new, g_new,H_new

function [x_new,f_new,g_new,H_new] = Newton(x,g,H,problem,method) 
  A = H;
  beta = method.options.beta;

  if min(diag(A)) > 0
        eta = 0;
  else
        eta = -min(diag(A)) + beta;
  end

  % Initialize R to empty, indicating the Cholesky factorization hasn't been found yet
  R = [];
    
  % Initialize flag to indicate unsuccessful factorization
  p = 1;
    
  % Attempt Cholesky decomposition in a loop
  while p > 0
      % Attempt to apply the Cholesky algorithm to A + eta_k * I
      [R, p] = chol(A + eta * eye(size(A)), 'upper');
        
      if p > 0
          % If p > 0, the factorization failed; prepare to adjust eta_k
          eta = max(2 * eta, beta);
       end
  end
   
  % modified H
  H = R' * R; 
  d = -H\g;

  % determine step size
  alpha_0 = method.options.alpha_0;
  tau = method.options.tau; 
  c_1_ls = method.options.c_1_ls;
  alpha = BLS(x, g, alpha_0, tau, c_1_ls, d, problem);

  x_new = x + alpha * d;
  f_new = problem.compute_f(x_new, problem);
  g_new = problem.compute_g(x_new, problem);
  H_new = problem.compute_H(x_new, problem);
end
