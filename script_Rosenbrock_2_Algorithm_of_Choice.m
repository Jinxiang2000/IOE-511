close all
clear all
clc

addpath(genpath("functions"));
problem.name = 'Rosenbrock_2';

problem.x0 = ones(2, 1);
problem.x0(1) = -1.2;

%% Modified Newton with Wolfe line search
method.name = 'NewtonW';
options = [];

[x_p7,f_p7] = optSolver_JEKY(problem,method,options);
