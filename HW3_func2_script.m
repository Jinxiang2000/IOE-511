%% Script to run HW3 function2


close all
clear all
clc

% set problem (minimal requirement: name of problem)
addpath('functions')
problem.name = 'HW3_fun2';
problem.x0 = [1; 1];
problem.n = length(problem.x0);


%% (1) Algorithm 1: Gradient descent with backtracking line search
% set method
method.name = 'GradientDescent';
method.options.step_type = 'Backtracking';

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [2.9999; 0.5000]; f^* = 1.0069e-09;

%% (2) Algorithm 2: Modified Newton
% set method
method.name = 'Modified_Newton';

% set options
options = [];


[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [3.0000; 0.5000]; f^* = 3.0634e-10;


%% (3) Algorithm 3: BFGS
% set method
method.name = 'BFGS';
% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [3.0001; 0.5000]; f^* = 5.9923e-10;


%% (4.1) Algorithm 4.1: L-BFGS with default m = 2
% set method
method.name = 'L-BFGS';
% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [3.0000; 0.5000]; f^* = 3.6269e-10;

%% (4.2) Algorithm 4.2: L-BFGS with m = 5
% set method
method.name = 'L-BFGS';
method.options.m = 5;  %memory length

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [3.0000; 0.5000]; f^* = 2.3346e-14;

%% (4.3) Algorithm 4.3: L-BFGS with m = 10
% set method
method.name = 'L-BFGS';
method.options.m = 10;  %memory length

% set options
options = [];

[x,f] = optSolver_Shao_Yubo(problem,method,options);
% x^* = [3.0000; 0.5000]; f^* = 9.3629e-14;


