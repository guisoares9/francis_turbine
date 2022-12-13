function power = restricaoTwo(x)

    %Travando a potência em 100MW

    d1 = x(1);
    d2 = x(2);
    r1 = x(3);
    r2 = x(4);
    w = x(5);

    %99999999 <= power (Observe os sinais)
    %(Pela documentação, entrega-se somente o lado
    %esquerdo da inequação sendo o direito igual a zero por defalut)

    %power = - 1000*vazao(d1,d2,r1,r2,w)*w*(r1/(pi*d1^2/4) - r2/(pi*d2^2/4)) + 99999999;

    power = vazao(d1,d2,r1,r2,w);

end