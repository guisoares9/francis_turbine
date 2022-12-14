function pwr = pow(x)    
    % Dados
    francis = Francis; 
    k = francis.k; rho = francis.rho;
    beta_2 = francis.beta_2;
    % Inserir dados
%     francis.d1 = x(1); francis.d2 = x(2);    
%     francis.r1 = x(3); francis.r2 = x(4);
%     francis.w  = x(5); francis.b  = x(6);

    d1 = x(1); d2 = x(2);    
    r1 = x(3); r2 = x(4);
    w  = x(5); b  = x(6);
    
    q = vazao(x);    
    U2 = w*r2; U1 = w*r1;
    Vt1 = k*q/(2*pi*r1*b);
    
    % Modularizacao
    C = @(q, r) q/(2*pi*b*r);  
    
    pwr = (U2^2 - U2*C(q,r2)/tan(beta_2) - U1*Vt1)*q*rho;
end