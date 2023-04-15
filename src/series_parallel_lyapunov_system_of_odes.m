function dydt = series_parallel_lyapunov_system_of_odes(t, y)
    % Implement the system of ODEs that were derived from theoretical
    % analysis. ode45 is used as shown [here](https://www.mathworks.com/help/matlab/ref/ode45.html)
    %
    % [y     y_est  theta1_est  theta2_est]
    %  |       |        |           |
    % [y(1)    y(2)    y(3)       y(4)]

    % Fetch the data
    [data] = load_data(2);
    a = data{1};
    b = data{2};
    theta_m = data{3};
    gamma_1 = data{4};
    gamma_2 = data{5};
    u = data{6};
    noise = data{7};

    % ODEs system
    e = y(1) + noise(t) - y(2);
    dydt(1) = -a*y(1) + b*u(t);
    dydt(2) = -theta_m*y(2) + (theta_m-y(3))*y(1) + y(4)*u(t);
    dydt(3) = -gamma_1*e*y(1);
    dydt(4) = gamma_2*e*u(t);

    % Function must return column vectors
    dydt = transpose(dydt);

end

