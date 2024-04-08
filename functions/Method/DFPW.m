% IOE 511/MATH 562, University of Michigan
% Code written by: Jinxiang Ma
%
% DFP Method with Wolfe Line Search
% Input: x, g, D,  problem, method, options
% D is the inverse of Hessian Matrix (D_0 = I when k = 0)
% x is the starting point of the current iteration
% g is the gradient of function at current point x
%
%Output: x_new, f_new, g_new, D_new, alpha_k
% x_new is the starting point of next iteration 
% f_new is the function value at x_new
% g_new is the gradient at x_new
% D_new is the updated approximation of the inverse Hessian Matrix




function[x_new, f_new, g_new, D_new] = DFPW(x, g, D, problem, method, options)
    %Compute the serach direction 
    d = -D * g;

    %Compute the step length alpha_k 
    % Perform Wolfe line search to determine step length
    % determine step size
    alpha_0 = method.options.alpha_0;
    c_1_ls = method.options.c_1_ls;
    c_2_ls = method.options.c_2_ls;
    alpha_k = Wolfe(x, g, alpha_0, c_1_ls, c_2_ls, d, problem);
       
    % Calculate the change in position by multiplying the step length with the search direction
    sk = alpha_k * d;
    % Update the current position by adding the change in position to the current position
    x_new = x + sk;
    % Compute the new gradient at the updated position
    g_new = problem.compute_g(x_new);
    % Compute the new function value at the updated position
    f_new = problem.compute_f(x_new);
    % Calculate the difference in gradients between the current and new position
    yk = g_new - g;
    % Check if the curvature condition is satisfied; if not, skip the Hessian update
    if(sk'* yk)< options.term_tol * norm(sk) * norm(yk)
        % Skip the Inverse Hessian matrix update if the curvature condition is not met
        D_new = D; 
    else
        % Update the approximation of the inverse Hessian matrix using the DFP formula
        D_new = D + (sk*sk')/(sk'*yk) - ((D*yk)*(yk'*D))/(yk'*D*yk);
    end



end