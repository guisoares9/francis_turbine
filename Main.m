clc
close all

v0 = [5     5         3         8         2       .5];
% 4.9463    4.9463    3.1623    8.1608    3.4008    1.4947
%   RESTRICAO: <=
A = [0 0 1 -1 0 0];
B  = 0;
%   RESTRICAO: ==
Aeq = [];
Beq  = [];
%   LIMITES: ??
LB = [0 0 0 0 0 .1];                % LOWER BOUND
UB = [Inf Inf Inf Inf Inf 3];      % UPPER BOUND

fmincon(@eta, v0, A, B, Aeq, Beq, LB, UB, @restricao)