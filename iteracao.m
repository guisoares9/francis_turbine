clc
close all

% Iteracao 5 - Bom dia

% Parametros para otimizar
% d1 = 1.5; d2 = 2.9; r1 = 2; r2 = 6.065; w = 14.8; b = .2;

param = [1.8018    3.0828    2.1506    6.0391   14.3361    0.2883];
d1 = param(1); d2 = param(2); r1 = param(3); r2 = param(4); w = param(5); b = param(6);

% Dados
rho = 1000; g = 9.81; h = 100; mu = 0.001; d = (d1+d2)/2; eps = 0.0006;
U1 = w*r1; U2 = w*r2; k = 0.1; beta_2 = 1.3090;

% Velocidades
v1 = @(q) 4*q/(pi*d1^2); v2 = @(q) 4*q/(pi*d2^2); vm = @(q) mean([v1(q) v2(q)]);

% Modularizacao
C = @(q, r) q/(2*pi*b*r);
f = @(q) friction(rho*vm(q)*d/mu, eps);

% Vazao
vazao_fun = @(q) U2^2 - U2*C(q,r2)/tan(beta_2) - U1*k*C(q,r1) + f(q)/2 * 180 * vm(q)^2 - g*h;
vazao_fun2 = @(q) vazao_fun(q)^2;
Q = fminsearch(vazao_fun2, 500)

Vt1 = k*Q/(2*pi*r1*b);

% Potencia
pwr = @(q) (U2^2 - U2*C(q,r2)/tan(beta_2) - U1*Vt1)*q*rho;
power = pwr(Q)

% Eficiencia
et = @(q) 100e6/(100e6+q*friction(rho*vm(Q)*d/mu, eps)/2 * 180 * vm(Q)^2);
ef = et(Q)
