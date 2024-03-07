%           Input: x
%           Output: f(x)
%
function [f] = HW3_func2_func(x, ~)
    % Define the vector y
    y = [1.5; 2.25; 2.625];

    % Initialize the function value
    f = 0;

    % Compute the summation
    for i = 1:3
        f = f + (y(i) - x(1) * (1 - x(2)^i))^2;
    end
end
