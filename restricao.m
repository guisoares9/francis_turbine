function [c, ceq] = restricao(x)

    %Travando a potência em 100MW

    d1 = x(1);
    d2 = x(2);
    r1 = x(3);
    r2 = x(4);
    w = x(5);
    b = x(6);

    %power <= 100000001 (Pela documentação, entrega-se somente o lado
    %esquerdo da inequação sendo o direito igual a zero por defalut)

    c = [];
    
    v1 = @(q) 4*q/(pi*d1^2);
    v2 = @(q) 4*q/(pi*d2^2);
    
    q = vazao(d1,d2,r1,r2,w,b);
    %ceq = 1000*q^2 * w*(r1 * v1(q) - r2 * v2(q)) - 100e6;

    U2 = w*r2;
    U1 = w*r1;
    k = 0.1;
    Vt1 = k*q/(2*pi*r1*b);
    beta_2 = 1.3090; %75 graus em rad
    g = 9.81;

    ceq = U2^2/g - U2*q*tan(beta_2)^-1/(2*pi*r2*b*g) - U1*Vt1/g - 100e6;

end