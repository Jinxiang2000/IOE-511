%% Script to run HW3 function3 (n = 2)
close all
clear all
clc


addpath('functions')
problem.name = 'HW3_fun3';

problem.x0 = [1; 0];
problem.n = length(problem.x0);


%% (1) Algorithm 1: Gradient descent with backtracking line search
% set method
method.name = 'GradientDescent';
method.options.step_type = 'Backtracking';

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [-1.2448; 1.0000]; f^* = -0.2056;

%% (2) Algorithm 2: Modified Newton
% set method
method.name = 'Modified_Newton';

% set options
options = [];


[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [-1.2448; 0.9923]; f^* = -0.2056;


%% (3) Algorithm 3: BFGS
% set method
method.name = 'BFGS';

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [-1.2448; 1.0080]; f^* = -0.2056;

%% (4.1) Algorithm 4.1: L-BFGS with default m = 2
% set method
method.name = 'L-BFGS';

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [-1.2448; 1.0017]; f^* = -0.2056;

%% (4.2) Algorithm 4.2: L-BFGS with m = 5
% set method
method.name = 'L-BFGS';
method.options.m = 5;  %memory length

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [-1.2448; 0.9963]; f^* = -0.2056;

%% (4.3) Algorithm 4.3: L-BFGS with m = 10
% set method
method.name = 'L-BFGS';
method.options.m = 10;  %memory length

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [-1.2448; 1.0017]; f^* = -0.2056;
