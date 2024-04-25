close all
clear all
clc

addpath(genpath("functions"));
problem.name = 'P4_quad_1000_1000';

rng(0)
problem.x0 = 20*rand(1000,1)-10;


%% (1) Method 1: Gradient descent with backtracking line search
method.name = 'GradientDescent';
options = [];

[x1,f1] = optSolver_JEKY(problem,method,options);
fprintf('GradientDescentW \n');
%% (2) Method 2: Gradient descent with Wolfe line search
method.name = 'GradientDescentW';
options = [];

[x2,f2] = optSolver_JEKY(problem,method,options);
fprintf('GradientDescentW \n');
%% (3) Method 3: Modified Newton with backtracking line search
method.name = 'Newton';
options = [];

[x3,f3] = optSolver_JEKY(problem,method,options);

fprintf('GradientDescentW \n');

%% (4) Method 4: Modified Newton with Wolfe line search
method.name = 'NewtonW';
options = [];

[x4,f4] = optSolver_JEKY(problem,method,options);
fprintf('GradientDescentW \n');
%% (5) Method 5: Trust region Newton with CG subproblem solve
method.name = 'TRNewtonCG';
options = [];

[x5,f5] = optSolver_JEKY(problem,method,options);
fprintf('GradientDescentW \n');
%% (6) Method 6: SR1 quasi-Newton with CG subproblem solver
method.name = 'TRSR1CG';
options = [];

[x6,f6] = optSolver_JEKY(problem,method,options);
fprintf('GradientDescentW \n');
%% (7) Method 7:  BFGS quasi-Newton with backtracking line search
method.name = 'BFGS';
options = [];

[x7,f7] = optSolver_JEKY(problem,method,options);
fprintf('GradientDescentW \n');

%% (8) Method 8:  BFGS quasi-Newton with Wolfe line search
method.name = 'BFGSW';
options = [];

[x8,f8] = optSolver_JEKY(problem,method,options);
fprintf('GradientDescentW \n');

%% (9) Method 9: DFP quasi-Newton with backtracking line search
method.name = 'DFP';
options = [];

[x9,f9] = optSolver_JEKY(problem,method,options);
fprintf('GradientDescentW \n');
%% (10) Method 10:  DFP quasi-Newton with Wolfe line search
method.name = 'DFPW';
options = [];

[x10,f10] = optSolver_JEKY(problem,method,options);
fprintf('GradientDescentW \n');