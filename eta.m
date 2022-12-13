function rendimento = eta(x)
    global rho mu eps
    
    d1 = x(1); d2 = x(2);    
    d = mean([d1 d2]);
    
    q = vazao(x);
    v1 = 4*q/(pi*d1^2);
    v2 = 4*q/(pi*d2^2);
    vm = mean([v1 v2]);
        
    rendimento = 1 - 100e6/(100e6+q*friction(rho*vm*d/mu, eps)/2 * 180 * vm^2);
end