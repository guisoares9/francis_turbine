function rendimento = eta(x)

    d1 = x(1); d2 = x(2);
    r1 = x(3); r2 = x(4);
    w  = x(5); b  = x(6);

    rho = 1000; mu = 0.001;
    d = (d1+d2)/2;
    eps = 0.0003;
    
    q = vazao(x);
    v1 = 4*q/(pi*d1^2);
    v2 = 4*q/(pi*d2^2);
    vm = mean([v1 v2]);
        
    rendimento = 1 - 100e6/(100e6+q*friction(rho*vm*d/mu, eps)/2 * 180 * vm^2);
    
    % (100e6/(rho*vazao(d1,d2,r1,r2,w)*g*h))^-1;

end