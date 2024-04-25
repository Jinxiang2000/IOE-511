% IOE 511/MATH 562, University of Michigan
% Code written by: Yubo Shao

% Problem Number: 9
% Problem Name: DataFit_2:
% Problem Description: DataFit. Dimension n = 2

%           Input: x
%           Output: g = nabla f(x)
%
function [g] = DataFit_2_grad(x, ~)
    w = x(1);
    z = x(2);
    % Define the vector y
    y = [1.5; 2.25; 2.625];

    % Gradient calculation
    grad_w = 0;
    grad_z = 0;
    for i = 1:3
        grad_w = grad_w + 2*(y(i) - w*(1 - z^i))*(-(1 - z^i));
        grad_z = grad_z + 2*(y(i) - w*(1 - z^i))*(w*i*z^(i-1));
    end
    g = [grad_w; grad_z];
end