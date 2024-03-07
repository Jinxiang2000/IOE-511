
% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas & Yubo Shao

% Function that runs a chosen algorithm on a chosen problem
%           Inputs: problem, method, options (structs)
%           Outputs: final iterate (x) and final function value (f)
function [x,f] = optSolver_Shao_Yubo(problem,method,options)
  % set problem, method and options
  [problem] = setProblem(problem);
  [method] = setMethod(method);
  [options] = setOptions(options);

  % compute initial function/gradient/Hessian
  x = problem.x0; % starting point
  f = problem.compute_f(x, problem); 
  g = problem.compute_g(x, problem);
  k = 0;

  switch method.name
      case 'GradientDescent'
          % No calculation of H is needed for Gradient Descent
      case {'Newton', 'Modified_Newton'}
          H = problem.compute_H(x, problem);
      case 'BFGS'
          H = eye(length(x)); % Initial Hessian approximation H0 = I
      case 'L-BFGS'
          S = [];
          Y = [];
          rho = [];
      otherwise
          error('Method not implemented yet!')
  end

  norm_g = norm(g,inf); % L-infty norm of gradient
  norm_g_0 = norm_g;

  % set initial iteration counter
  
  %f_k = [f, k]; % store the updated 'f' after each iteration
  %alpha_k = []; % store the step size each iteration

  while norm_g > options.term_tol * max(norm_g_0, 1) && k < options.max_iterations
    % take step according to a chosen method
    switch method.name
        case 'GradientDescent'
            [x,f,g,alpha] = GDStep(x,g,problem,method);
        case 'Newton'
            [x,f,g,H,alpha] = NewtonStep(x,g,H,problem,method);
        case 'Modified_Newton'
            [x,f,g,H,alpha] = Modified_NewtonStep(x,g,H,problem,method);
        case 'BFGS'
            [x,f,g,H,alpha] = BFGS(x,g,H,problem,method,options);
            %fprintf('Current function value: %.4f\n', f);
            %fprintf('Current step size: %.5f\n', alpha);
        case 'L-BFGS'
            [x,f,g,S,Y,rho,alpha] = L_BFGS(x,g,S,Y,rho,problem,method,options);   
            %fprintf('Current function value: %.4f\n', f);
            %fprintf('Current BLS step size: %.5f\n', alpha);
        otherwise
            error('Method not implemented yet!')
    end
    norm_g = norm(g,inf);
    % increment iteration counter
    k = k + 1;
    fprintf('Current iterations: %.5f\n', k);
    %f_k = [f_k; f, k];  %update f vs. k
    %alpha_k = [alpha_k; alpha, k];  %update alpha vs. k
  end
end