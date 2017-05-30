%---------Regula Falsi Method--------------
clc;clear all


a = 0;b = 2;
tol = 10e-10;
f = @(x) x.*sin(x) - 1;
[r, Error] = regula(f,a,b,tol);
%[r2,Error2] = bisect(f,a,b,tol); %You can compare the difference between
%the Regula Falsi Method to the Bisection Method by downloading the
%Bisection example as wll and un-commenting this line
%/////////////////////////////////