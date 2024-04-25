% IOE 511/MATH 562, University of Michigan
% Code written by:

%           Inputs:
%           Outputs:
%
function [x_new,f_new,g_new,H_new] = TRSR1CG(x,g,H,problem,method,options)
% compute the function value at x
f = problem.compute_f(x);

% construct m(d)
m = @(d)f + g'*d + 0.5*d'*H*d;

% compute d by using CG method
term_tol_CG = method.options.term_tol_CG;
max_iterations_CG = method.options.max_iterations_CG;
delta = method.options.delta_0;

for i = 1:max_iterations_CG % compute x_new by using adaptive delta

    d_star = cg_tr(x, H, delta, term_tol_CG, problem); % CG Steihaug

    rou = (f - problem.compute_f(x + d_star))/(m(zeros(length(x),1))-m(d_star));% compute rou

    % practical choice for delta
    c_1 = method.options.c_1_tr;
    c_2 = method.options.c_2_tr;

    if rou > c_1
        x_new = x + d_star;
        if rou > c_2
            delta = 1.2 * delta;
        end
    else
        x_new = x;
        delta = 0.8 * delta;
    end

end

  g_new = problem.compute_g(x_new, problem);
  f_new = problem.compute_f(x_new, problem);
  s_k = x_new - x;
  y_k = g_new - g;

  % Check the condition to skip the update
  if abs((y_k - H * s_k)' * s_k) < options.term_tol * norm(y_k - H * s_k) * norm(s_k)
     % Skip the update
     H_new = H;
  else
     % SR1 update
     rho = 1 / ((y_k - H * s_k)' * s_k);
     V = y_k - H * s_k;
     H_new = H + rho * (V * V');
  end

end