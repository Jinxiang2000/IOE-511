%% P4_quad_1000_1000
close all
clear all
clc


% set problem (minimal requirement: name of problem)
currentDir = pwd;
[parentDir, ~, ~] = fileparts(currentDir);
functionsDir = fullfile(parentDir, 'functions');
addpath(functionsDir);

problem.name = 'P4_quad_1000_1000';
rng(0)
problem.x0 = 20*rand(1000,1)-10;


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


%% Plotting f(x_k) - f* vs k for each method
figure; 
% Plot each method with a different color
f_star = -7.10545918154e+04;
semilogy(f_k_t_1(:,2), f_k_t_1(:,1) - f_star, 'r-', 'LineWidth', 2); hold on;
semilogy(f_k_t_21(:,2), f_k_t_21(:,1) - f_star, 'b-', 'LineWidth', 2);
semilogy(f_k_t_22(:,2), f_k_t_22(:,1) - f_star, 'g-', 'LineWidth', 2);
semilogy(f_k_t_23(:,2), f_k_t_23(:,1) - f_star, 'k-', 'LineWidth', 2);
semilogy(f_k_t_24(:,2), f_k_t_24(:,1) - f_star, 'm-', 'LineWidth', 2);
semilogy(f_k_t_25(:,2), f_k_t_25(:,1) - f_star, 'c-', 'LineWidth', 2);
hold off;

% Adding labels and legend
xlabel('Iteration ($k$)', 'Interpreter', 'latex');
ylabel('$\log(f(x_k) - f^*)$', 'Interpreter', 'latex');
title('Convergence Plot (P4\_quad\_1000\_1000) vs. Iteration');
legend('BFGS', 'L-BFGS (m = 3)', 'L-BFGS (m = 7)', 'L-BFGS (m = 11)', 'L-BFGS (m = 15)', 'L-BFGS (m = 20)', 'Location', 'northeast');
grid off;


%% Plotting f(x_k) - f* vs t for each method
figure;

% Plot each method with a different color
semilogy(f_k_t_1(:,3), f_k_t_1(:,1) - f_star, 'r-', 'LineWidth', 2); hold on;
semilogy(f_k_t_21(:,3), f_k_t_21(:,1) - f_star, 'b-', 'LineWidth', 2);
semilogy(f_k_t_22(:,3), f_k_t_22(:,1) - f_star, 'g-', 'LineWidth', 2);
semilogy(f_k_t_23(:,3), f_k_t_23(:,1) - f_star, 'k-', 'LineWidth', 2);
semilogy(f_k_t_24(:,3), f_k_t_24(:,1) - f_star, 'm-', 'LineWidth', 2);
semilogy(f_k_t_25(:,3), f_k_t_25(:,1) - f_star, 'c-', 'LineWidth', 2);
hold off;

% Adding labels and legend
xlabel('Time/Cost', 'Interpreter', 'latex');
ylabel('$\log(f(x_k) - f^*)$', 'Interpreter', 'latex');
title('Convergence Plot (P4\_quad\_1000\_1000) vs. Time/Cost');
legend('BFGS', 'L-BFGS (m = 3)', 'L-BFGS (m = 7)', 'L-BFGS (m = 11)', 'L-BFGS (m = 15)', 'L-BFGS (m = 20)', 'Location', 'northeast');
grid off;