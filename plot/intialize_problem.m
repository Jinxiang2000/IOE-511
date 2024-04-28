function [problem] = intialize_problem(problem_name,problem)
if problem_name == "P1_quad_10_10"
    rng(0)
    problem.x0 = 20*rand(10,1)-10;
elseif problem_name == "P2_quad_10_1000"
    rng(0)
    problem.x0 = 20*rand(10,1)-10;
elseif problem_name == "P3_quad_1000_10"
    rng(0)
    problem.x0 = 20*rand(1000,1)-10;
elseif problem_name == "P4_quad_1000_1000"
    rng(0)
    problem.x0 = 20*rand(1000,1)-10;
elseif problem_name == "P5_quartic_1"
    problem.x0 = [cos(70); sin(70); cos(70); sin(70)];
elseif problem_name == "P6_quartic_2"
    problem.x0 = [cos(70); sin(70); cos(70); sin(70)];
elseif problem_name == "Rosenbrock_2"
    problem.x0 = ones(2, 1);
    problem.x0(1) = -1.2;
elseif problem_name == "Rosenbrock_100"
    problem.x0 = ones(100, 1);
    problem.x0(1) = -1.2;
elseif problem_name == "DataFit_2"
    problem.x0 = [1; 1];
elseif problem_name == "Exponential_10"
    problem.x0 = zeros(10, 1);
    problem.x0(1) = 1;
elseif problem_name == "Exponential_1000"
    problem.x0 = zeros(100, 1);
    problem.x0(1) = 1;
elseif problem_name == "Genhumps_5"
    problem.x0 = 506.2 * ones(5, 1);
    problem.x0(1) = -506.2;
end