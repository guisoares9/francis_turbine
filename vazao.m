function vazao = vazao(d1, d2, r1, r2, w, b)
    % 100% CERTO <- KRAVEI
    rho = 1000;
    g = 9.81;
    h = 100;
    mu = 0.001;
    d = (d1+d2)/2;
    eps = 0.0003;
    
    v1 = @(q) 4*q/(pi*d1^2);
    v2 = @(q) 4*q/(pi*d2^2);
    vm = @(q) mean([v1(q) v2(q)]);

    %f = @(q) -w * (r2 * v2(q) - r1 * v1(q)) + friction(rho*vm(q)*d/mu, eps)/2 * 180 * vm(q)^2 - g*h;

    U2 = w*r2;
    U1 = w*r1;
    k = 0.1;
    beta_2 = 1.3090; %75° em rad

    f = @(q) U2^2 - U2*q*(tan(beta_2))^-1/(2*pi*r2*b) - U1*(k*q/(2*pi*r1*b)) + friction(rho*vm(q)*d/mu, eps)/2 * 180 * vm(q)^2 - g*h;
    
    vazao = fsolve(f, 100);

end