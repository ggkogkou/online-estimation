function task1()
    % Clear console
    clc;

    % Solve the system for gradient method
    % System ode: y' = -a*y + b*u
    [data] = load_data(1);
    a = data{1};
    b = data{2};
    p = data{3};

    % Solve the ODE
    tspan = 0 : 0.001 : 25;
    [~, y_matrix] = ode45(@system_of_odes, tspan, [0; 0; 0; 0; 0]);

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

    % Plot (a, a_est) and (b, b_est)
    a = zeros(length(tspan), 1) + a;
    b = zeros(length(tspan), 1) + b;

    figure(2)
    plot(tspan, a, tspan, a_est, 'LineWidth', 1.5);
    legend("a", "a_e_s_t");
    title("a and estimated a_e_s_t parameters");

    figure(3)
    plot(tspan, b, tspan, b_est, 'LineWidth', 1.5);
    legend("b", "b_e_s_t");
    title("b and estimated b_e_s_t parameters");

    % Plot the Mean Square Error between a, b, y and their estimators
    figure(4)
    plot(tspan, mse_y, tspan, mse_a, tspan, mse_b, 'LineWidth', 1.5);
    legend("MSE y, y_e_s_t", "MSE a, a_e_s_t", "MSE b, b_e_s_t");
    title("MSE of estimated output y and a, b parameters and their real values");

end

