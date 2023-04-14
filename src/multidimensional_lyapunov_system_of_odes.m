function dydt = multidimensional_lyapunov_system_of_odes(t, y)
    % Implement the system of ODEs that were derived from theoretical
    % analysis. ode45 is used as shown [here](https://www.mathworks.com/help/matlab/ref/ode45.html)
    %
    % [y1    y2  y1_est  y2_est  a11  a12  a21   a22   b1   b2]
    %  |     |     |        |     |    |    |     |    |    |
    % [y(1) y(2)  y(3)    y(4)   y(5) y(6) y(7)  y(8) y(9) y(10)]  

    % Fetch the data
    [data] = load_data(3);
    A = data{1};
    B = data{2};
    gamma_1 = data{3};
    gamma_2 = data{4};
    u = data{5};

    % ODEs system
    dydt(1) = A(1, 1)*y(1) + A(1, 2)*y(2) + B(1)*u(t);
    dydt(2) = A(2, 1)*y(1) + A(2, 2)*y(2) + B(2)*u(t);
    dydt(3) = y(3)*y(5) + y(4)*y(6) + y(9)*u(t);
    dydt(4) = y(3)*y(7) + y(4)*y(8) + y(10)*u(t);
    dydt(5) = gamma_1*(y(1)*y(3) - y(3)^2);
    dydt(6) = gamma_1*(y(2)*y(3) - y(3)*y(4));
    dydt(7) = gamma_1*(y(1)*y(4) - y(3)*y(4));
    dydt(8) = gamma_1*(y(2)*y(4) - y(4)^2);
    dydt(9) = gamma_2*(y(1)-y(3))*u(t);
    dydt(10) = gamma_2*(y(2)-y(4))*u(t);

    % Function must return column vectors
    dydt = transpose(dydt);

end

