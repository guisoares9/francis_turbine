function pwr = pow(x)

    d1 = x(1); d2 = x(2);
    r1 = x(3); r2 = x(4);
    w  = x(5); b  = x(6);
    
    q = vazao(x);
    
    U2 = w*r2; U1 = w*r1;
    k = 0.1; rho = 1000;
    Vt1 = k*q/(2*pi*r1*b);
    beta_2 = degtorad(75);  
    
    % Modularizacao
    C = @(q, r) q/(2*pi*b*r);  
    
    pwr = (U2^2 - U2*C(q,r2)/tan(beta_2) - U1*Vt1)*q*rho;
end