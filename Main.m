clc
close all

% Global vars
global h g k rho mu eps beta_2
rho = 1000;     g = 9.81;
mu = 0.001;     h = 100;
eps = 0.0006;   k = 0.1;
beta_2 = degtorad(75);

%       d1      d2         r1       r2       w         b
v0 = [3.6    3.8    2.    6.3245   4    .8];

%   RESTRICAO: <=
A = [0 0 1 -1 0 0];
B  = 0;
%   RESTRICAO: ==
Aeq = [];
Beq  = [];
%   LIMITES: ??
LB = [0 0 0 0 0 0];                % LOWER BOUND
UB = [Inf Inf Inf Inf Inf 3];      % UPPER BOUND

fmincon(@eta, v0, A, B, Aeq, Beq, LB, UB, @restricao)