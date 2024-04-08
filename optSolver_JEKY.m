% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao, Jinxiang Ma

% Function that runs a chosen algorithm on a chosen problem
%           Inputs: problem, method, options (structs)
%           Outputs: final iterate (x) and final function value (f)

function [x,f] = optSolver_JEKY(problem,method,options)
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
      case {'GradientDescent', 'GradientDescentW'}
          % No calculation of H is needed for Gradient Descent
      case {'Newton', 'NewtonW'}
          H = problem.compute_H(x, problem);
      case {'TRNewtonCG', 'TRSR1CG'}
          %TBD
      case {'BFGS', 'BFGSW'}
          H = eye(length(x));
      case {'L_BFGS', 'L_BFGSW'}
          S = [];
          Y = [];
          rho = [];
      %case {'TRNewtonCG', 'TRSR1CG'}

      case {'DFP', 'DFPW'}
          %D is the inverse Hessian Approximation
          D = eye(length(x));
      otherwise
          error('Method not implemented yet!')
  end

  norm_g = norm(g,inf); % L-infty norm of gradient
  norm_g_0 = norm_g;

  while norm_g > options.term_tol * max(norm_g_0, 1) && k < options.max_iterations
    % take step according to a chosen method
    switch method.name
        case 'GradientDescent'
            [x,f,g] = GradientDescent(x,g,problem,method);
        case 'GradientDescentW'
            [x,f,g] = GradientDescentW(x,g,problem,method);    
        case 'Newton'
            [x,f,g,H] = Newton(x,g,H,problem,method);
        case 'NewtonW'
            [x,f,g,H] = NewtonW(x,g,H,problem,method); 
        %{    
        case 'TRNewtonCG'
            [] = TRNewtonCG();
        case 'TRSR1CG'
            [] = TRSR1CG();  
        %}
        case 'BFGS'
            [x,f,g,H] = BFGS(x,g,H,problem,method,options);
        case 'BFGSW'
            [x,f,g,H] = BFGSW(x,g,H,problem,method,options);    
        case 'DFP'
            [x, f, g, D] = DFP(x, g, D, problem, method, options);
        case 'DFPW'
            [x, f, g, D] = DFPW(x, g, D, problem, method, options);   
        case 'L_BFGS'
            [x,f,g,S,Y,rho] = L_BFGS(x,g,S,Y,rho,problem,method,options);   
        case 'L_BFGSW'
            [x,f,g,S,Y,rho] = L_BFGSW(x,g,S,Y,rho,problem,method,options);       
        otherwise
            error('Method not implemented yet!')
    end
    norm_g = norm(g,inf);
    k = k + 1;
  end
end