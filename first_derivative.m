clear all
close all  %close all the figure
clc
%% defining a poly func: 3x^2 + 5x +7
poly_p = [3, 5, 7];

%% derivative of the poly func
p_der = polyder(poly_p);
p_der_eval = polyval(p_der, 0)

%% Finite difference method --Forward
x_0 = 0;
h = 0.2;
der_for_diff_first = (polyval(poly_p, x_0 + h) - polyval(poly_p, x_0))/h

%% Finite difference method --Backward
der_bac_diff_first = (polyval(poly_p, x_0) - polyval(poly_p, x_0 - h))/h

%% Finite difference method -- Central
der_cen_diff_first = (polyval(poly_p, x_0 + h) - polyval(poly_p, x_0 - h))/(2*h)