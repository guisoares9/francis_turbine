clc
close all

global h g k rho mu eps beta_2

% Parametros para otimizar
% 3.5946    3.8065    2.0638    6.3545    3.9569    0.9353
param = [7.7    8.5    2    7.    4.6    1.6061];
d1 = param(1); d2 = param(2); r1 = param(3); r2 = param(4); w = param(5); b = param(6);

% Dados
d = (d1+d2)/2;
U1 = w*r1; U2 = w*r2;

% Velocidades
v1 = @(q) 4*q/(pi*d1^2); v2 = @(q) 4*q/(pi*d2^2); vm = @(q) mean([v1(q) v2(q)]);

% Modularizacao
C = @(q, r) q/(2*pi*b*r);
f = @(q) friction(rho*vm(q)*d/mu, eps);

% Vazao
vazao_fun = @(q) U2^2 - U2*C(q,r2)/tan(beta_2) - U1*k*C(q,r1) - g*h + f(q)/2 * 180 * vm(q)^2;
vazao_fun2 = @(q) vazao_fun(q)^2;
Q = fminsearch(vazao_fun2, 500)

Vt1 = k*Q/(2*pi*r1*b);

% Potencia
pwr = @(q) (U2^2 - U2*C(q,r2)/tan(beta_2) - U1*Vt1)*q*rho;
power = pwr(Q)

% Eficiencia
Wtotal = rho * h * g * Q
Wutil  = rho * Q * (U2^2 - U2*C(Q,r2)/tan(beta_2) - U1*k*C(Q,r1))
Wloss  = f(Q)/2 * 180 * vm(Q)^2 * rho * Q

rendimento = Wutil/(Wutil+Wloss)s