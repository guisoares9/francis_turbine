function custo = eta(x)    
    % Dados
    francis = Francis;    
    h = francis.h; g = francis.g;
    k = francis.k; rho = francis.rho;
    mu = francis.mu; eps = francis.eps;
    LD = francis.LD;
    beta_2 = francis.beta_2;        
    
    d1 = x(1); d2 = x(2);    
    r1 = x(3); r2 = x(4);
    w  = x(5); b  = x(6);
    d = mean([d1 d2]);
    
    q = vazao(x);
    v1 = 4*q/(pi*d1^2);
    v2 = 4*q/(pi*d2^2);
    vm = mean([v1 v2]);
    
    U1= w*r1;
    U2 = w*r2;
    
    % Modularizacao
    C = @(q, r) q/(2*pi*b*r);
    f = friction(rho*vm*d/mu, eps);
    
    % wtotal = WTotal(obj, q);
    Wutil  = rho * q * (U2^2 - U2*C(q,r2)/tan(beta_2) - U1*k*C(q,r1));
    Wloss  = f/2 * LD * vm^2 * rho * q;

    custo = 1 - Wutil/(Wutil+Wloss);
    
    
end