clc
close all

% Iteracao 4

% Parametros para otimizar
d1 = 1.5; d2 = 2.9; r1 = 2; r2 = 6.065; w = 14.8; b = .2;

% Dados
rho = 1000; g = 9.81; h = 100; mu = 0.001; d = (d1+d2)/2; eps = 0.0003;
U1 = w*r1; U2 = w*r2; k = 0.1; beta_2 = 1.3090;

% Velocidades
v1 = @(q) 4*q/(pi*d1^2); v2 = @(q) 4*q/(pi*d2^2); vm = @(q) mean([v1(q) v2(q)]);

% Vazao
f = @(q) U2^2 - U2*q*(tan(beta_2))^-1/(2*pi*r2*b) - U1*(k*q/(2*pi*r1*b)) - g*h + friction(rho*vm(q)*d/mu, eps)/2 * 180 * vm(q)^2;
f2 = @(q) f(q)^2;
Q = fminsearch(f2, 500)

% Potencia
pwr = @(q) U2^2 - U2*q*(tan(beta_2))^-1/(2*pi*r2*b) - U1*(k*q/(2*pi*r1*b));
power = pwr(Q)*Q*rho

% Eficiencia
v1 = 4*Q/(pi*d1^2); v2 = 4*Q/(pi*d2^2); vm = mean([v1 v2]);
et = @(q) 100e6/(100e6+q*friction(rho*vm*d/mu, eps)/2 * 180 * vm^2);
ef = et(Q)
