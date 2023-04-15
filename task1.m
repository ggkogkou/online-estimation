function task1()
    % Clear console and workspace
    clc; clear;
    addpath("src/")

    % Solve the system for gradient method
    % System ode: y' = -a*y + b*u
    [data] = load_data(1);
    a = data{1};
    b = data{2};
    p = data{3};

    % Solve the ODE
    tspan = 0 : 0.01 : 50;
    [~, y_matrix] = ode45(@gradient_system_of_odes, tspan, [0; 0; 0; 0; 0]);

    % Separate the columns of the above solution
    y = y_matrix(:, 1);
    phi1 = y_matrix(:, 2);
    phi2 = y_matrix(:, 3);
    theta1_est = y_matrix(:, 4);
    theta2_est = y_matrix(:, 5);

    % Compute the estimated y and a, b
    y_est = theta1_est.*phi1 + theta2_est.*phi2;
    a_est = p - theta1_est(:);
    b_est = theta2_est(:);

    % Compute Mean Square Error between a, b, y and their estimators
    mse_y = (y - y_est).^2;
    mse_a = (a - a_est).^2;
    mse_b = (b - b_est).^2;

    % Plot y and y_est
    figure(1)
    plot(tspan, y, tspan, y_est, 'LineWidth', 1.5);
    legend("y", "y_e_s_t");
    title("y and estimated by gradient method y_e_s_t");

    % Plot Estimated vs Real Parameters
    a = zeros(length(tspan), 1) + a;
    b = zeros(length(tspan), 1) + b;

    figure(2)
    plot(tspan, a, tspan, a_est, tspan, b, tspan, b_est, 'LineWidth', 1.5);
    legend("a", "a_e_s_t", "b", "b_e_s_t");
    title("Estimated vs Real Parameters");

    % Plot the Mean Square Error between a, b, y and their estimators
    figure(3)
    plot(tspan, mse_y, tspan, mse_a, tspan, mse_b, 'LineWidth', 1.5);
    legend("MSE y, y_e_s_t", "MSE a, a_e_s_t", "MSE b, b_e_s_t");
    title("MSE of estimated output y and a, b parameters and their real values");

end

