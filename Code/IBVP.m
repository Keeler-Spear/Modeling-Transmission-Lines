clearvars
clc

l = 1; % Inductance per meter (H/m)
r = 500; % Resistance per meter (Ω/m)
c = 0.1; % Capacitance per meter (F/m)
g = 1; % Conductance per meter (S/m)
len = 0.1; % Length of transmission line (m)
time = 10; % The number of seconds the transmission line will be modeled for (s)
h = 0.01; % The space step to be used (m)
k = 0.001; % The time step to be used (s)

% Solves the telegrapher's equation
[x, t, V] = teEqCT(l, c, r, g, len, time, @f0, @f1, @g0, @gl, h, k);

% Plots the solution to the telegrapher's equation
mesh(x, t, V)
xlabel('Position (m)')
ylabel('Time (s)')
zlabel('Voltage (V)')
