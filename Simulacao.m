clc
close all

nonlcon = @restricao;

fmincon(@eta, [1.5446 4.4620 2.3100 3.3781 0.1358 0.5], [0 0 1 -1 0 0], [0], [], [], [0 0 0 0 0 0], [Inf Inf Inf Inf Inf 3], nonlcon)

% CHUTE INICIAL
% r1 = 2; r2 = 3; d1 = 2; d2 = 2*r1; w = 0.10135;
% Iteracao 1
% d1 = 1.8; d2 = 2.1931*2; r1 = 2.1931; r2 = 3.2414; w = 0.09599;
% Iteracao 2
% d1 = 1.7; d2 = 2*2.41; r1 = 2.41; r2 = 3.45; w = 33.7671 / (60*2*pi);
% Iteracao 3 - Novo ETA
% % 1.5446    4.4620    2.3100    3.3781    0.1358
% d1 = 1.5446; d2 = 4.462; r1 = 2.31; r2 = 3.3781; w = 0.1358;
% rho = 1000; g = 9.81; h = 100; mu = 0.001; d = (d1+d2)/2; eps = 0.0003;
% 
% v1 = @(q) 4*q/(pi*d1^2); v2 = @(q) 4*q/(pi*d2^2); vm = @(q) mean([v1(q) v2(q)]);
% 
% f = @(q) -w * (r2 * v2(q) - r1 * v1(q)) + friction(rho*vm(q)*d/mu, eps)/2 * 180 * vm(q)^2 - g*h;
% f2 = @(q) f(q)^2;
% 
% Q = fminsearch(f2, 500)
% 
% pwr = @(q) 1000*q^2 * w*(r1 * v1(q) - r2 * v2(q));
% power = pwr(Q)
% 
% v1 = 4*Q/(pi*d1^2);
% v2 = 4*Q/(pi*d2^2);
% vm = mean([v1 v2]);
% 
% eta = @(q) 100e6/(rho*q*g*h);
% ef = 100e6/(100e6+Q*friction(rho*vm*d/mu, eps)/2 * 180 * vm^2)
