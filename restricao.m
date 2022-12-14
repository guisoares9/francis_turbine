function [c, ceq] = restricao(x)    
    % Dados
    francis = setFrancis(x);       
    francis.q = francis.setVazao;
    
    c = [];    
    ceq = [pow(x)-100e6 eqEnergia(x, francis.q)];
end