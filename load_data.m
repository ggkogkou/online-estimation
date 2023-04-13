function [data] = load_data(task_number)
    % Function to return the data of the corresponding task

    % Task 1 -- System ODE: y' = -a*y + b*u
    a = 3;
    b = 0.5;
    p = 5;
    gamma = 1;
    %u = @(t) 10*sin(3*t);
    u = @(t) 10;

    % Task 2

    % Task 3

    % Return the values
    if task_number == 1
        data = {a, b, p, gamma, u};
    elseif task_number == 2
        data = 0;
    elseif task_number == 3
        data = 0;
    else
        fprintf("No Task was selected to return the corresponding data\n");
    end

end

