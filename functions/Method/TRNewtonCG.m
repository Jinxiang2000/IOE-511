% IOE 511/MATH 562, University of Michigan
% Code written by:

%           Inputs:
%           Outputs:
%
function [x_new,f_new,g_new,H_new] = TRNewtonCG(x,g,H,problem,method)

% compute the function value at x
f = problem.compute_f(x);

% construct m(d)
m = @(d)f + g'*d + 0.5*d'*H*d;

% compute d by using CG method
term_tol_CG = method.options.term_tol_CG;
max_iterations_CG = method.options.max_iterations_CG;
delta = method.options.delta_0;

for i = 1:max_iterations_CG % compute x_new by using adaptive delta 
    d_star = cg_tr(x, H, delta, term_tol_CG, problem); % CG Steihaug

    % compute rou
    rou = (f - problem.compute_f(x + d_star))/(m(zeros(length(x),1))-m(d_star));

    % practical choice for delta
    c_1 = method.options.c_1_tr;
    c_2 = method.options.c_2_tr;

    if rou > c_1
        x_new = x + d_star;
        if rou > c_2
            delta = 1.3 * delta;
        end
    else
        x_new = x;
        delta = 0.8 * delta;
    end

end

f_new = problem.compute_f(x_new, problem);
g_new = problem.compute_g(x_new, problem);
H_new = problem.compute_H(x_new, problem);
end