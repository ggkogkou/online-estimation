function [data] = load_data(task_number)
    % Function to return the data of the corresponding task

    % Task 1 -- System ODE: y' = -a*y + b*u
    a = 3;
    b = 0.5;
    p = 5;
    gamma = 1;
    %u_gradient = @(t) 10*sin(3*t);
    u_gradient = @(t) 10;

    % Task 2
    a = 3;
    b = 0.5;
    theta_m = 2; % Lyapunov Series-Parallel Configuration
    gamma_1 = 1;
    gamma_2 = 1;
    u_lyapunov = @(t) 10*sin(3*t);
    noise_freq = 40;
    noise_amplitude = 0.5;
    noise = @(t) noise_amplitude*sin(2*pi*noise_freq*t);
    % noise = @(t) 0;

    % Task 3

    % Return the values
    if task_number == 1
        data = {a, b, p, gamma, u_gradient};
    elseif task_number == 2
        data = {a, b, theta_m, gamma_1, gamma_2, u_lyapunov, noise};
    elseif task_number == 3
        data = 0;
    else
        fprintf("No Task was selected to return the corresponding data\n");
    end

end

