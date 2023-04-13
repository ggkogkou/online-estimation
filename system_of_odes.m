function dydt = system_of_odes(t, y)
    % Implement the system of ODEs that were derived from theoretical
    % analysis. ode45 is used as shown [here](https://www.mathworks.com/help/matlab/ref/ode45.html)
    %
    % [y    phi1, phi2, theta1_est, theta2_est]
    %  |      |     |       |           |
    % [y(1)  y(2)  y(3)     y(4)       y(5)]

    % Fetch the data
    [data] = load_data(1);
    a = data{1};
    b = data{2};
    p = data{3};
    gamma = data{4};
    u = data{5};

    % ODEs system
    e = [(p-a-y(4))*u(t); 
        (b-y(5))*u(t)];
    dydt(1) = -a*y(1) + b*u(t);
    dydt(2) = -p*y(2) + y(1);
    dydt(3) = -p*y(3) + u(t);
    dydt(4) = gamma*e(1)*y(2);
    dydt(5) = gamma*e(2)*y(3);

    % Function must return column vectors
    dydt = transpose(dydt);

end

