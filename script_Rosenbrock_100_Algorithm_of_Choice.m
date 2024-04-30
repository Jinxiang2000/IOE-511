close all
clear all
clc

addpath(genpath("functions"));
problem.name = 'Rosenbrock_100';

problem.x0 = ones(100, 1);
problem.x0(1) = -1.2;

%% Modified Newton with Wolfe line search
method.name = 'NewtonW';
options = [];

[x_p8,f_p8] = optSolver_JEKY(problem,method,options);

