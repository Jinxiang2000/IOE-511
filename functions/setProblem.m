% Function that specifies the problem. Specifically, a way to compute: 
%    (1) function values; (2) gradients; and, (3) Hessians.
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
      case 'P1_quad_10_10'
          problem.compute_f = @quad_10_10_func;
          problem.compute_g = @quad_10_10_grad;
          problem.compute_H = @quad_10_10_Hess;
      case 'P2_quad_10_1000'
          problem.compute_f = @quad_10_1000_func;
          problem.compute_g = @quad_10_1000_grad;
          problem.compute_H = @quad_10_1000_Hess;
      case 'P3_quad_1000_10'
          problem.compute_f = @quad_1000_10_func;
          problem.compute_g = @quad_1000_10_grad;
          problem.compute_H = @quad_1000_10_Hess;
      case 'P4_quad_1000_1000'
          problem.compute_f = @quad_1000_1000_func;
          problem.compute_g = @quad_1000_1000_grad;
          problem.compute_H = @quad_1000_1000_Hess;
      case 'P5_quartic_1'
          problem.compute_f = @quartic_1_func;
          problem.compute_g = @quartic_1_grad;
          problem.compute_H = @quartic_1_Hess;
      case 'P6_quartic_2'
          problem.compute_f = @quartic_2_func;
          problem.compute_g = @quartic_2_grad;
          problem.compute_H = @quartic_2_Hess;
      case 'Rosenbrock_2'
          problem.compute_f = @Rosenbrock_2_func;
          problem.compute_g = @Rosenbrock_2_grad;
          problem.compute_H = @Rosenbrock_2_Hess;
      case 'Rosenbrock_100'
          problem.compute_f = @Rosenbrock_100_func;
          problem.compute_g = @Rosenbrock_100_grad;
          problem.compute_H = @Rosenbrock_100_Hess;
      case 'DataFit_2'
          problem.compute_f = @DataFit_2_func;
          problem.compute_g = @DataFit_2_grad;
          problem.compute_H = @DataFit_2_Hess;
      case 'Exponential_10' 
          problem.compute_f = @Exponential_10_func;
          problem.compute_g = @Exponential_10_grad;
          problem.compute_H = @Exponential_10_Hess;
      case 'Exponential_1000'
          problem.compute_f = @Exponential_1000_func;
          problem.compute_g = @Exponential_1000_grad;
          problem.compute_H = @Exponential_1000_Hess;
      case 'Genhumps_5'     
          problem.compute_f = @genhumps_5_func;
          problem.compute_g = @genhumps_5_grad;
          problem.compute_H = @genhumps_5_Hess;
      otherwise
          error('Problem not defined!!!');
  end


