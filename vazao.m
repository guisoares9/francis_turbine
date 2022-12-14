function vazao = vazao(x)  
    
    eqEnergia2 = @(q) eqEnergia(x, q)^2;
    vazao = fminsearch(eqEnergia2, 100);    % <--- V_ZERO FIXADO EM 100 m^3/s
end