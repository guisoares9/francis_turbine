function pwr = pow(x)

    d1 = x(1);
    d2 = x(2);
    r1 = x(3);
    r2 = x(4);
    w = x(5);
    b = x(6);

    v1 = @(q) 4*q/(pi*d1^2);
    v2 = @(q) 4*q/(pi*d2^2);
    
    U2 = w*r2;
    U1 = w*r1;
    k = 0.1;
    beta_2 = 1.3090; %75° em rad
    q = vazao(d1,d2,r1,r2,w,b);
    pwr = U2^2 - U2*q*(tan(beta_2))^-1/(2*pi*r2*b) - U1*(k*q/(2*pi*r1*b));

end