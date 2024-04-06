% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% 
%           Inputs: x, f, g, problem, method, options
%           Outputs: x_new,f_new,g_new,S,Y,rho
%
function [x_new,f_new,g_new,S,Y,rho] = L_BFGS(x,g,S,Y,rho,problem,method,options)
  m = method.options.m; 
  H = eye(length(x)); % Initial Hessian approximation H_k^(0) = I
  q = g;
  size_S = size(S, 2); %current length of S
  alpha_i = zeros(1, size_S); %store alpha_i
    
  % First loop
  for i = size_S:-1:1
      alpha_i(i) = rho(i) * (S(:,i)' * q);
      q = q - alpha_i(i) * Y(:,i);
  end

  % Apply the initial Hessian approximation to the vector q
  r = H * q;
    
  % Second loop
  for i = 1:size_S
    beta = rho(i) * (Y(:,i)' * r);
    r = r + S(:,i) * (alpha_i(i) - beta);
  end
  
  % final r is new "-d"
  d = -r;
  alpha_0 = method.options.alpha_0;
  tau = method.options.tau; 
  c_1_ls = method.options.c_1_ls;
  alpha = BLS(x, g, alpha_0, tau, c_1_ls, d, problem);

  s = alpha * d; %new s
  x_new = x + s;
  g_new = problem.compute_g(x_new, problem);
  f_new = problem.compute_f(x_new, problem);
  y = g_new - g; %new Y

  % Skip update if s'y is not sufficiently positive
  if s' * y >= options.term_tol * norm(s) * norm(y)
      if size_S == m
          S = [S(:,2:end), s];
          Y = [Y(:,2:end), y];
          rho = [rho(2:end), 1/(y'*s)];
      else
          S = [S, s];
          Y = [Y, y];
          rho = [rho, 1/(y'*s)];
      end
  else
      warning('L_BFGS:SkippingUpdate', 'Skipping update due to insufficient curvature condition.');
  end
end
