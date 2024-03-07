%           Input: x
%           Output: H = nabla^2 f(x)
%
function [H] = HW3_func2_Hess(x, problem)
    % Extract w and z from the input vector x
    w = x(1);
    z = x(2);

    % Define the vector y
    y = [1.5; 2.25; 2.625];

    % Initialize elements of the Hessian matrix
    H11 = 0; % Partial derivative of f with respect to w twice
    H12 = 0; % Mixed partial derivative of f with respect to w and z
    H22 = 0; % Partial derivative of f with respect to z twice

    % Calculate H11, H12 (and H21, which is equal to H12), and H22
    for i = 1:3
        H11 = H11 + 2*(1 - z^i)^2;
        H12 = H12 + 2*i*z^(i-1)*(y(i) + 2*w*(z^i - 1));
        % Since H12 = H21, no need to calculate H21 separately
    end

    % Calculate A for H22
    A = 2*(w^2); % Initialize A with the w^2 term
    for i = 2:3
        A = A + 2*((w*i*z^(i-1))^2 + (y(i) + w*(z^i - 1))*w*i*(i-1)*z^(i-2));
    end
    H22 = A;

    % Construct the Hessian matrix
    H = [H11, H12; H12, H22];
end