clear all
close all
clc

%% defining the mesh i.e no. of points
n_points = 5;
domain_size = 1;
h = domain_size/(n_points - 1);

%% initializing the problem
y(1) = 0;
y(n_points) = 1;

y_new(1) = 0;
y_new(n_points) = 1;

%% error defining
err_mag = 1;
err_req = 1e-7;
iterations = 1;

%% Calculations
while err_mag > err_req
    for i = 2:(n_points - 1)
        y_new(i) = 0.5.*(y(i-1) + y(i+1));
        iterations = iterations + 1;
    end
    %% error calculation
    err_mag = 0;
    for i = 2:(n_points - 1)
        err_mag = err_mag + abs(y(i) - y_new(i));
    end
    % Assiging y to y_new
    y = y_new;
end
