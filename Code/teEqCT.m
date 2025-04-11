% Numerically solves the telegrapher's equation with Dirichlet boundary conditions using second order centered time, second order centered space, and first order centered time
%
% V = teEqCT(L, C, R, G, length, time, v0, v1, bc1, bc2, h, k)
%
% Inputs:
%   L: Inductance per meter (H/m)
%   C: Capacitance per meter (F/m)
%   R: Resistance per meter (Ω/m)
%   G: Conductance per meter (S/m)
%   length: Length of transmission line (m)
%   time: The number of seconds the transmission line will be modeled for (s)
%   v0: The transmission line’s initial voltage, V(x,0)
%   v1: The transmission line’s voltage at the first time step, V(x,k)
%   bc0 = The voltage entering the left end of the transmission line, V(0, t)
%   bcl: The voltage entering the right end of the transmission line, V(length, t)
%   h: The space step to be used (m)
%   k: The time step to be used (s)
%
% Output:
%   x: A matrix of space values corresponding to where the voltage has been evaluated.
%   t: A matrix of time values corresponding to where the voltage has been evaluated.
%   V: A matrix of voltage values over the space and time intervals. Each row represents the voltage across the transmission line at the corresponding time
function [x, t, V] = teEqCT(L, C, R, G, length, time, v0, v1, bc0, bcl, h, k)

% Preparing constants to simplify the method
xMax = length ./ h;
tMax = time ./ k;
a = L * C / (k.^2);
b = (R * C + G * L) / (2 * k);
h2 = 1. / (h * h);
y = 1 ./ (a + b);
d = 2 * a - G * R - 2 * h2;
u = b - a;

% Creating axes for plotting
x = linspace(0, length, xMax);
t = linspace(0, time, tMax);

% Creating a matrix to contain the voltage values
V = zeros(tMax, xMax);

% Adding the initial condition values to the matrix
for i=1:1:xMax
    V(1, i) = v0((i - 1) * h); % First row = V(x, 0)
    V(2, i) = v1((i - 1) * h); % Second row = V(x, k)
end

% Adding the boundary condition values to the matrix
for i=3:1:tMax
    V(i, 1) = bc0((i - 1) * k); % Left column = bc1 = V(0, t)
    V(i, xMax) = bcl((i - 1) * k); % Right column = bc2 = V(length, t)
end

% Filling in the matrix using second order centered time, second order
% centered space, and first order centered time
for i=2:1:(tMax - 1)
    for j=2:1:(xMax - 1)
        V(i + 1, j) = y * (d * V(i, j) + u * V(i - 1, j) + h2 * (V(i, j + 1) - V(i, j - 1)));
    end
end

end
