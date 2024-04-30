close all
clear all
clc

addpath(genpath("functions"));
problem.name = 'Rosenbrock_100';

problem.x0 = ones(100, 1);
problem.x0(1) = -1.2;

%% (3) Method 3: Modified Newton with backtracking line search
method.name = 'Newton';
options = [];

[x3,f3] = optSolver_JEKY(problem,method,options);

