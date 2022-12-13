function vazao = vazao(x)

    d1 = x(1); d2 = x(2);
    r1 = x(3); r2 = x(4);
    w  = x(5); b  = x(6);
    
    % Dados
    rho = 1000;     g = 9.81; h = 100;
    mu = 0.001;     d = (d1+d2)/2;
    eps = 0.0003;   k = 0.1;
    U2 = w*r2;      U1= w*r1;
    beta_2 = degtorad(75);
    
    % Velocidade 1, 2 e Media
    v1 = @(q) 4*q/(pi*d1^2);
    v2 = @(q) 4*q/(pi*d2^2);
    vm = @(q) mean([v1(q) v2(q)]);    
        
    % Fator de Friccao
    f = @(q) friction(rho*vm(q)*d/mu, eps);
    
    % Modularizacao
    C = @(q, r) q/(2*pi*b*r);
    
    % Funcao da Vazao
    vazao_fun = @(q) U2^2 - U2*C(q,r2)/tan(beta_2) - U1*k*C(q,r1) + f(q)/2 * 180 * vm(q)^2 - g*h;
    
    vazao = fminsearch(vazao_fun, 100);% <--- V_ZERO FIXADO EM 100 m^3/s
end

%f = @(q) -w * (r2 * v2(q) - r1 * v1(q)) + friction(rho*vm(q)*d/mu, eps)/2 * 180 * vm(q)^2 - g*h;