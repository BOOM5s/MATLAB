clear all
close all 
clc

%% Defining the mesh
n_points = 100;
domain_size = 1;
h = domain_size/(n_points - 1);

%% Initializing the solution
y(n_points, n_points) = 0;
y(1,:) = 1;

y_new(n_points, n_points) = 0;
y_new(1,:) = 1;


%% Error
error_mag = 1;
error_req = 1e-6;
iteration = 0;

%% Calculation

while error_mag > error_req
    for i = 2:(n_points - 1)
        for j = 2:(n_points-1)
            y_new(i,j) = 0.25.*(y(i+1, j) + y_new(i-1, j) + y(i, j+1) + y_new(i, j-1));
            iteration = iteration+1;
        end
    end
    %calculation of error magnitude
    error_mag = 0;
    for i = 2:(n_points - 1)
        for j = 2:(n_points - 1)
        error_mag = error_mag + abs(y(i,j) - y_new(i,j));
        end
    end
    % Assiging new to be old
    y = y_new;
end

%% potting
x_dom = ((1:n_points) - 1).*h;
y_dom = 1 - ((1:n_points) - 1).*h;
[X,Y] = meshgrid(x_dom, y_dom);
contourf(X, Y, y, 12)
colorbar