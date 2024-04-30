%% Rosenbrock

% set problem (minimal requirement: name of problem)
currentDir = pwd;
[parentDir, ~, ~] = fileparts(currentDir);
functionsDir = fullfile(parentDir, 'functions');
addpath(functionsDir);

% Initialization
% problem.name = "P1_quad_10_10";
problem = intialize_problem(problem.name,problem);

%% (1) Algorithm 1 (reference): BFGS
method.name = 'BFGS';
options = [];
[f_k_t_1] = optSolver_JEKY_analysis(problem,method,options);
%% (2.1) Algorithm 2.1: L-BFGS with m = 3
method.name = 'L_BFGS';
method.options.m = 3; 
options = [];

[f_k_t_21] = optSolver_JEKY_analysis(problem,method,options);

%% (2.2) Algorithm 2.1: L-BFGS with m = 7
method.name = 'L_BFGS';
method.options.m = 7; 
options = [];

[f_k_t_22] = optSolver_JEKY_analysis(problem,method,options);
%% (2.3) Algorithm 2.1: L-BFGS with m = 11
method.name = 'L_BFGS';
method.options.m = 11; 
options = [];

[f_k_t_23] = optSolver_JEKY_analysis(problem,method,options);
%% (2.4) Algorithm 2.1: L-BFGS with m = 15
method.name = 'L_BFGS';
method.options.m = 15; 
options = [];

[f_k_t_24] = optSolver_JEKY_analysis(problem,method,options);
%% (2.5) Algorithm 2.1: L-BFGS with m = 20
method.name = 'L_BFGS';
method.options.m = 20; 
options = [];

[f_k_t_25] = optSolver_JEKY_analysis(problem,method,options);

%% (2.5) Algorithm 2.1: L-BFGS with m = 50
method.name = 'L_BFGS';
method.options.m = 50; 
options = [];

[f_k_t_50] = optSolver_JEKY_analysis(problem,method,options);

% save data
question_string = problem.name;
final_data(1,1) = question_string;
final_data(1,2) = "BFGS";
final_data(1,[3:4]) = f_k_t_1(end,[2:3]);
final_data(2,1) = question_string;
final_data(2,2) = "LBFGS(m = 3)";
final_data(2,[3:4]) = f_k_t_21(end,[2:3]);
final_data(3,1) = question_string;
final_data(3,2) = "LBFGS(m = 7)";
final_data(3,[3:4]) = f_k_t_22(end,[2:3]);
final_data(4,1) = question_string;
final_data(4,2) = "LBFGS(m = 11)";
final_data(4,[3:4]) = f_k_t_23(end,[2:3]);
final_data(5,1) = question_string;
final_data(5,2) = "LBFGS(m = 15)";
final_data(5,[3:4]) = f_k_t_24(end,[2:3]);
final_data(6,1) = question_string;
final_data(6,2) = "LBFGS(m = 20)";
final_data(6,[3:4]) = f_k_t_25(end,[2:3]);
final_data(7,1) = question_string;
final_data(7,2) = "LBFGS(m = 50)";
final_data(7,[3:4]) = f_k_t_50(end,[2:3]);

save('big_question_data.mat','final_data')