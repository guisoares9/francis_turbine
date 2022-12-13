clc
close all

%       d1      d2      r1      r2          w       b
v0 = [1.6600    2.9856    2.0960    6.0452   14.375    0.22];

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