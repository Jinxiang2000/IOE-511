% Function that specifies the method and method specific options. 
% 
%           Input: method (struct); required (method.name)
%           Output: method (struct)
%
% Error(s): 
%   (1) if method not specified
%
function [method] = setMethod(method)
  % check is method name specified
  if ~isfield(method,'name')
      error('Method not specified!!!')
  end

  if ~isfield(method,'options')
      method.options = [];
  end 

  % Initialize default parameters based on method name
  switch method.name
    case {'GradientDescent', 'Newton', 'BFGS', 'DFP', 'L_BFGS'}
        if ~isfield(method.options, 'alpha_0')
            method.options.alpha_0 = 10.0;
        end
        if ~isfield(method.options, 'tau')
            method.options.tau = 0.5;
        end
        if ~isfield(method.options, 'c_1_ls')
            method.options.c_1_ls = 1e-4;
        end

    case {'GradientDescentW', 'NewtonW', 'BFGSW', 'DFPW', 'L_BFGSW'}
        if ~isfield(method.options, 'alpha_0')
            method.options.alpha_0 = 1.0;
        end
        if ~isfield(method.options, 'c_1_ls')
            method.options.c_1_ls = 1e-4;
        end 
        if ~isfield(method.options, 'c_2_ls')
            method.options.c_2_ls = 1e-2;
        end
    case {'TRNewtonCG', 'TRSR1CG'}
        if ~isfield(method.options, 'c_1_tr')
            method.options.c_1_tr = 0.3; 
        end
        if ~isfield(method.options, 'c_2_tr')
            method.options.c_2_tr = 1; 
        end 
        if ~isfield(method.options, 'term_tol_CG')
            method.options.term_tol_CG = 1e-6; 
        end
        if ~isfield(method.options, 'max_iterations_CG')
            method.options.max_iterations_CG = 40; 
        end
        if ~isfield(method.options, 'delta_0')
            method.options.delta_0 = 1; 
        end   
    otherwise
        error('Method not implemented yet!');
  end
   

  %{
  switch method.name  %quasi-Newton additional parameters?
      case {'DFP', 'DFPW'}
          


  end
  %}

  switch method.name  
      case {'Newton', 'NewtonW'}
          if ~isfield(method.options, 'beta')
              method.options.beta = 1e-6;
          end
      case {'L_BFGS', 'L_BFGSW'}
          if ~isfield(method.options, 'm')
              method.options.m = 20;
          end       
  end

end