%% Genhumps_5
close all
clear all
clc


% set problem (minimal requirement: name of problem)
currentDir = pwd;
[parentDir, ~, ~] = fileparts(currentDir);
functionsDir = fullfile(parentDir, 'functions');
addpath(functionsDir);

problem.name = 'Genhumps_5';
problem.x0 = 506.2 * ones(5, 1);
problem.x0(1) = -506.2;



%% (1) Algorithm 1 (reference): BFGS
method.name = 'BFGS';
options = [];
[g_k_t_1] = optSolver_JEKY_analysis(problem,method,options);
%% (2.1) Algorithm 2.1: L-BFGS with m = 3
method.name = 'L_BFGS';
method.options.m = 3; 
options = [];

[g_k_t_21] = optSolver_JEKY_analysis(problem,method,options);

%% (2.2) Algorithm 2.2: L-BFGS with m = 7
method.name = 'L_BFGS';
method.options.m = 7; 
options = [];

[g_k_t_22] = optSolver_JEKY_analysis(problem,method,options);
%% (2.3) Algorithm 2.3: L-BFGS with m = 11
method.name = 'L_BFGS';
method.options.m = 11; 
options = [];

[g_k_t_23] = optSolver_JEKY_analysis(problem,method,options);
%% (2.4) Algorithm 2.4: L-BFGS with m = 15
method.name = 'L_BFGS';
method.options.m = 15; 
options = [];

[g_k_t_24] = optSolver_JEKY_analysis(problem,method,options);
%% (2.5) Algorithm 2.5: L-BFGS with m = 20
method.name = 'L_BFGS';
method.options.m = 20; 
options = [];

[g_k_t_25] = optSolver_JEKY_analysis(problem,method,options);


%% (2.6) Algorithm 2.6: L-BFGS with m = 50
method.name = 'L_BFGS';
method.options.m = 50; 
options = [];

[g_k_t_26] = optSolver_JEKY_analysis(problem,method,options);

%% Plotting ||g(x_k)||_{inf} vs k for each method
figure; 
% Plot each method with a different color
semilogy(g_k_t_1(:,2), g_k_t_1(:,1), 'r-', 'LineWidth', 0.25); hold on;
semilogy(g_k_t_21(:,2), g_k_t_21(:,1), 'b-', 'LineWidth', 0.25);
semilogy(g_k_t_22(:,2), g_k_t_22(:,1), 'g-', 'LineWidth', 0.25);
semilogy(g_k_t_23(:,2), g_k_t_23(:,1), 'k-', 'LineWidth', 0.25);
semilogy(g_k_t_24(:,2), g_k_t_24(:,1), 'm-', 'LineWidth', 0.25);
semilogy(g_k_t_25(:,2), g_k_t_25(:,1), 'c-', 'LineWidth', 0.25);
semilogy(g_k_t_26(:,2), g_k_t_26(:,1), 'y-', 'LineWidth', 0.25);
hold off;

% Adding labels and legend
xlabel('Iteration ($k$)', 'Interpreter', 'latex');
ylabel('$||\nabla f(x_k)||_{inf}$', 'Interpreter', 'latex');
legend('BFGS', 'L-BFGS (m = 3)', 'L-BFGS (m = 7)', 'L-BFGS (m = 11)', 'L-BFGS (m = 15)', 'L-BFGS (m = 20)', 'L-BFGS (m = 50)', 'Location', 'northeast');
grid off;


%% Plotting ||g(x_k)||_{inf} vs t for each method
figure;

% Plot each method with a different color
semilogy(g_k_t_1(:,3), g_k_t_1(:,1), 'r-', 'LineWidth', 0.25); hold on;
semilogy(g_k_t_21(:,3), g_k_t_21(:,1), 'b-', 'LineWidth', 0.25);
semilogy(g_k_t_22(:,3), g_k_t_22(:,1), 'g-', 'LineWidth', 0.25);
semilogy(g_k_t_23(:,3), g_k_t_23(:,1), 'k-', 'LineWidth', 0.25);
semilogy(g_k_t_24(:,3), g_k_t_24(:,1), 'm-', 'LineWidth', 0.25);
semilogy(g_k_t_25(:,3), g_k_t_25(:,1), 'c-', 'LineWidth', 0.25);
semilogy(g_k_t_26(:,3), g_k_t_26(:,1), 'y-', 'LineWidth', 0.25);
hold off;

% Adding labels and legend
xlabel('Time/Cost ($t$)', 'Interpreter', 'latex');
ylabel('$||\nabla f(x_t)||_{inf}$', 'Interpreter', 'latex');
legend('BFGS', 'L-BFGS (m = 3)', 'L-BFGS (m = 7)', 'L-BFGS (m = 11)', 'L-BFGS (m = 15)', 'L-BFGS (m = 20)', 'L-BFGS (m = 50)', 'Location', 'northeast');
grid off;