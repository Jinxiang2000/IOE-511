% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas & Yubo Shao

% Function that specifies the problem. Specifically, a way to compute: 
%    (1) function values; (2) gradients; and, (3) Hessians (if necessary).
%
%           Input: problem (struct), required (problem.name)
%           Output: problem (struct)
%
% Error(s): 
%       (1) if problem name not specified;
%       (2) function handles (for function, gradient, Hessian) not found
%
function [problem] = setProblem(problem)
  % check is problem name available
  if ~isfield(problem,'name')
      error('Problem name not defined!!!')
  end

  % set function handles according the the selected problem
  switch problem.name 
      case 'Rosenbrock'
          problem.compute_f = @rosen_func;
          problem.compute_g = @rosen_grad;
          problem.compute_H = @rosen_Hess;
      case 'Quadratic'
          problem.compute_f = @quadratic_func;
          problem.compute_g = @quadratic_grad;
          problem.compute_H = @quadratic_Hess;
      case 'HW3_fun2'
          problem.compute_f = @HW3_func2_func;
          problem.compute_g = @HW3_func2_grad;
          problem.compute_H = @HW3_func2_Hess;
      case 'HW3_fun3'
          problem.compute_f = @HW3_func3_func;
          problem.compute_g = @HW3_func3_grad;
          problem.compute_H = @HW3_func3_Hess;
      otherwise
          error('Problem not defined!!!');
end