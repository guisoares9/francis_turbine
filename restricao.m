function [c, ceq] = restricao(x)    
    global h g k rho mu eps beta_2
    
    d1 = x(1); d2 = x(2);
    r1 = x(3); r2 = x(4);
    w  = x(5); b  = x(6);
    
    c = [];
    
    d = mean([d1 d2]);
    q = vazao(x);
    U2 = w*r2;      U1= w*r1;
    
    % Velocidade 1, 2 e Media
    v1 = @(q) 4*q/(pi*d1^2);
    v2 = @(q) 4*q/(pi*d2^2);
    vm = @(q) mean([v1(q) v2(q)]); 
    
    % Modularizacao
    C = @(q, r) q/(2*pi*b*r);
    f = @(q) friction(rho*vm(q)*d/mu, eps);
    
    vazao_fun = U2^2 - U2*C(q,r2)/tan(beta_2) - U1*k*C(q,r1) + f(q)/2 * 180 * vm(q)^2 - g*h;
    
    ceq = [pow(x)-100e6 vazao_fun];
end