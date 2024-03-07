%% Script to run Rosenbrock

close all
clear all
clc


% set problem (minimal requirement: name of problem)
addpath('functions')
problem.name = 'Rosenbrock';
problem.x0 = [1.2;1.2];
problem.n = length(problem.x0);



%% (1) Algorithm 1: Gradient descent with backtracking line search
% set method
method.name = 'GradientDescent';
method.options.step_type = 'Backtracking';

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [1.0128; 1.0254]; f^* = 1.7322e-04;

%% (2) Algorithm 2: Modified Newton
% set method
method.name = 'Modified_Newton';

% set options
options = [];


[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [1.0000; 1.0000]; f^* = 3.2267e-14;


%% (3) Algorithm 3: BFGS
% set method
method.name = 'BFGS';

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [0.9999; 0.9997]; f^* = 1.5916e-08;

%% (4.1) Algorithm 4.1: L-BFGS with default m = 2
% set method
method.name = 'L-BFGS';

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [1.0000; 1.0000]; f^* = 7.3051e-14;

%% (4.2) Algorithm 4.2: L-BFGS with m = 5
% set method
method.name = 'L-BFGS';
method.options.m = 5;  %memory length

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [1.0000; 1.0000]; f^* = 1.0478e-11;

%% (4.3) Algorithm 4.3: L-BFGS with m = 10
% set method
method.name = 'L-BFGS';
method.options.m = 10;  %memory length

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [1.0000; 1.0000]; f^* = 4.2629e-12;


