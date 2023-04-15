function [data] = load_data(task_number)
    % Function to return the data of the corresponding task

    % Task 1 -- System ODE: y' = -a*y + b*u
    a = 3;
    b = 0.5;
    p = 2;
    gamma = 6;
    u_gradient = @(t) 10*sin(3*t);
    %u_gradient = @(t) 10;

    % Task 2
    a = 3;
    b = 0.5;
    theta_m = 2; % Lyapunov Series-Parallel Configuration
    gamma_1 = 1;
    gamma_2 = 1;
    u_lyapunov = @(t) 10*sin(3*t);
    noise_freq = 40;
    noise_amplitude = 25;
    noise = @(t) noise_amplitude*sin(2*pi*noise_freq*t);
    % noise = @(t) 0;

    % Task 3
    a11 = -0.25; a12 = 3;
    a21 = -5; a22 = 0;
    b1 = 0.5; b2 = 1.5;
    A = [a11, a12;
         a21, a22];
    B = [b1; b2];
    Am = [-1, 0;
           0, -1];
    u_lyapunov_2d = @(t) 3.5*sin(7.2*t) + 2*sin(11.7*t);

    % Return the values
    if task_number == 1
        data = {a, b, p, gamma, u_gradient};
    elseif task_number == 2
        data = {a, b, theta_m, gamma_1, gamma_2, u_lyapunov, noise};
    elseif task_number == 3
        data = {A, B, Am, gamma_1, gamma_2, u_lyapunov_2d};
    else
        fprintf("No Task was selected to return the corresponding data\n");
    end

end

