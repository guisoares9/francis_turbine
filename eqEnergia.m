function result = eqEnergia(x, q) 
    
    % Dados
    francis = setFrancis(x);   
    h = francis.h; g = francis.g; k = francis.k;
    rho = francis.rho; mu = francis.mu;
    eps = francis.eps; LD = francis.LD;
    beta_2 = francis.beta_2;   

    d1 = x(1); d2 = x(2);
    r1 = x(3); r2 = x(4);
    w  = x(5); b  = x(6);
    
    d = mean([d1 d2]);
    U2 = w*r2; U1= w*r1;
    
    % Velocidade 1, 2 e Media
    v1 = @(q) 4*q/(pi*d1^2);
    v2 = @(q) 4*q/(pi*d2^2);
    vm = @(q) mean([v1(q) v2(q)]);    
        
    % Fator de Friccao
    f = @(q) friction(rho*vm(q)*d/mu, eps);
    
    % Modularizacao
    C = @(q, r) q/(2*pi*b*r);
    
    result = U2^2 - U2*C(q,r2)/tan(beta_2) - U1*k*C(q,r1) - g*h + f(q)/2 * LD * vm(q)^2;
end