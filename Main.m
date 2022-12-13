clc
close all

%       d1      d2      r1      r2          w       b
v0 = [  1.5     2.9     2       6.065       14.8    .2];

%   RESTRICAO: <=
A = [0 0 1 -1 0 0];
B  = 0;
%   RESTRICAO: ==
Aeq = [];
Beq  = [];
%   LIMITES: ??
LB = [0 0 0 0 0 0];                 % LOWER BOUND
UB =  [Inf Inf Inf Inf Inf 3];      % UPPER BOUND

fmincon(@eta, v0, A, B, Aeq, Beq, LB, UB, @restricao)