function [c, ceq] = restricao(x)

    d1 = x(1); d2 = x(2);
    r1 = x(3); r2 = x(4);
    w  = x(5); b  = x(6);
    
    c = [];
    
    q = vazao(x);

    U2 = w*r2; U1 = w*r1;
    k = 0.1; g = 9.81;
    Vt1 = k*q/(2*pi*r1*b);
    beta_2 = degtorad(75);    

    ceq = U2^2/g - U2*q*tan(beta_2)^-1/(2*pi*r2*b*g) - U1*Vt1/g - 100e6; % Full errado
end