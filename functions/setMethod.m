% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

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
  
%% Initialize default parameters based on method name
switch method.name
    case 'GradientDescent'
        defaultStepType = 'Constant';
        
    case {'Newton', 'Modified_Newton'}
        defaultStepType = 'Backtracking';

    case {'BFGS', 'L-BFGS'}
        defaultStepType = 'Wolfe';        
    otherwise
        error('Method not implemented yet!');
end

%% Set default step type if not specified
if ~isfield(method.options, 'step_type')
    method.options.step_type = defaultStepType;
end

%% Set default parameters based on step type
switch method.options.step_type
    case 'Constant'
        if ~isfield(method.options, 'constant_step_size')
            method.options.constant_step_size = 1e-3;
        end
        
    case {'Backtracking', 'Wolfe'}
        % Common parameters for Backtracking and Wolfe
        if ~isfield(method.options, 'alpha_0')
            method.options.alpha_0 = 1.0;
        end
        if ~isfield(method.options, 'tau')
            method.options.tau = 0.5;
        end
        if ~isfield(method.options, 'c_1_ls')
            method.options.c_1_ls = 1e-4;
        end
        
        % Additional parameters for specific methods
        switch method.name
            case 'Modified_Newton'
                if ~isfield(method.options, 'beta')
                    method.options.beta = 1e-6;
                end
                
            case 'L-BFGS'
                if ~isfield(method.options, 'm')
                    method.options.m = 2;
                end
        end
        
        % Additional condition for Wolfe
        if strcmp(method.options.step_type, 'Wolfe')
            if ~isfield(method.options, 'c_2_ls')
                method.options.c_2_ls = 1e-2;
            end
        end
        
    otherwise
        error('Step type not implemented yet!');
end
end