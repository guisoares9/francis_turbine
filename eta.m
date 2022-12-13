function custo = eta(x)
    global h g k rho mu eps beta_2
    
    d1 = x(1); d2 = x(2);    
    r1 = x(3); r2 = x(4);
    w  = x(5); b  = x(6);
    d = mean([d1 d2]);
    
    q = vazao(x);
    v1 = 4*q/(pi*d1^2);
    v2 = 4*q/(pi*d2^2);
    vm = mean([v1 v2]);
    
    U2 = w*r2;      U1= w*r1;
    
    % Modularizacao
    C = @(q, r) q/(2*pi*b*r);
    f = friction(rho*vm*d/mu, eps);
    
    Wtotal = rho * h * g * q;
    Wutil  = rho * q * (U2^2 - U2*C(q,r2)/tan(beta_2) - U1*k*C(q,r1));
    Wloss  = f/2 * 180 * vm^2 * rho * q;

    custo = 1 - Wutil/(Wutil+Wloss);
end