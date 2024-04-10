

%% EXAMPLE CODE FOR CG

function d_star = cg_tr(x, B, delta, term_tol_CG,problem)
    % CG Steihaug algorithm to solve the trust region subproblem
    % Inputs:
    % x - initial point
    % B - Hessian matrix at x
    % delta - radius of the trust region
    % term_tol_CG - tolerance for the stopping criterion

    % Initialize
    z = zeros(size(x)); % Start at origin (no direction)
    r = problem.compute_g(x); % Initial residual
    p = -r; % Initial direction
    if norm(r) < term_tol_CG
        d_star = z; % Early exit if gradient is too small
        return;
    end

    for i = 1:length(x)
        % Check curvature
        Bp = B * p;
        if p' * Bp <= 0
            % Find tau such that ||z + tau*p|| = delta
            tau = (-z'*p + sqrt((z'*p)^2 - (p'*p)*(z'*z - delta^2))) / (p'*p);
            d_star = z + tau*p;
            return;
        end

        % Standard CG update
        alpha = (r' * r) / (p' * Bp);
        z_next = z + alpha * p;
        
        % Check if outside trust region
        if norm(z_next) >= delta
            % Find tau such that ||d + tau*z|| = delta
            tau = (-z'*p + sqrt((z'*p)^2 - (p'*p)*(z'*z - delta^2))) / (p'*p);
            d_star = z + tau*p;
            return;
        end

        r_next = r + alpha * Bp;
        if norm(r_next) < term_tol_CG
            d_star = z_next;
            return;
        end

        beta = (r_next' * r_next) / (r' * r);
        p = -r_next + beta * p;
        
        % Update for next iteration
        z = z_next;
        r = r_next;
    end

    d_star = z;
end