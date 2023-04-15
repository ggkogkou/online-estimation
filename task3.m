function task3()
    % Clear console and workspace
    clc; clear;
    addpath("src/")

    % Solve the 2D system for Lyapunov Series-Parallel method
    
    % System ode: y' = -Ay + B*u
    [data] = load_data(3);
    A = data{1};
    B = data{2};

    % Solve the ODE
    tspan = 0 : 0.01 : 100;

    % Lyapunov -- Series-Parallel Configuration
    [~, y_matrix] = ode45(@multidimensional_lyapunov_system_of_odes, tspan, [0; 0; 0; 0; 0; 0; 0; 0; 0; 0]);

    % Separate the columns of the above solution
    y1 = y_matrix(:, 1);
    y2 = y_matrix(:, 2);
    y1_est = y_matrix(:, 3);
    y2_est = y_matrix(:, 4);
    a11_est = y_matrix(:, 5);
    a12_est = y_matrix(:, 6);
    a21_est = y_matrix(:, 7);
    a22_est = y_matrix(:, 8);
    b1_est = y_matrix(:, 9);
    b2_est = y_matrix(:, 10);

    % Plot y_i and y_i_est
    figure(1)
    plot(tspan, y1, tspan, y1_est, 'LineWidth', 1.2);
    legend("y_1", "y_1_e_s_t");
    title("y1 and estimated y1_e_s_t: Lyapunov 2D");

    figure(2)
    plot(tspan, y2, tspan, y2_est, 'LineWidth', 1.2);
    legend("y_2", "y_2_e_s_t");
    title("y2 and estimated y2_e_s_t: Lyapunov 2D");

    % Plot (a, a_est) and (b, b_est)
    a11 = zeros(length(tspan), 1) + A(1, 1);
    a12 = zeros(length(tspan), 1) + A(1, 2);
    a21 = zeros(length(tspan), 1) + A(2, 1);
    a22 = zeros(length(tspan), 1) + A(2, 2);
    b1 = zeros(length(tspan), 1) + B(1);
    b2 = zeros(length(tspan), 1) + B(2);

    figure(3)
    plot(tspan, a11, tspan, a11_est, tspan, a12, tspan, a12_est, 'LineWidth', 1.2);
    legend("a11", "a11_e_s_t", "a12", "a12_e_s_t");
    title("Estimated vs Real Parameters of a_1_1 and a_1_2");

    figure(4)
    plot(tspan, a21, tspan, a21_est, tspan, a22, tspan, a22_est, 'LineWidth', 1.2);
    legend("a21", "a21_e_s_t", "a22", "a22_e_s_t");
    title("Estimated vs Real Parameters of a_2_1 and a_2_2");

    figure(5)
    plot(tspan, b1, tspan, b1_est, tspan, b2, tspan, b2_est, 'LineWidth', 1.2);
    legend("b1", "b1_e_s_t", "b2", "b2_e_s_t");
    title("Estimated vs Real Parameters of B");

    % Compute and plot the Mean Square Error between a, b, y 
    % and their estimators
    err_y1 = y1 - y1_est;
    err_y2 = y2 - y2_est;
    err_a11 = a11 - a11_est;
    err_a12 = a12 - a12_est;
    err_a21 = a21 - a21_est;
    err_a22 = a22 - a22_est;
    err_b1 = b1 - b1_est;
    err_b2 = b2 - b2_est;

    error_of_y = sqrt(err_y1.^2 + err_y2.^2);
    error_of_A = sqrt(err_a11.^2 + err_a12.^2 + err_a21.^2 + err_a22.^2);
    error_of_B = sqrt(err_b1.^2 + err_b2.^2);

    figure(6)
    plot(tspan, error_of_y, tspan, error_of_A, tspan, error_of_B, 'LineWidth', 1.2);
    legend("RMSE y, y_e_s_t", "RMSE a, a_e_s_t", "RMSE b, b_e_s_t");
    title("RMSE of estimated output y and A, B parameters and their real values");

end

