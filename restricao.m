function [c, ceq] = restricao(x)    
    % Dados
    francis = setFrancis(x);       
    francis.q = francis.setVazao;
    
    c = [pow(x)-120e6 80e6-pow(x)]; % 90 < pow < 110
    ceq = francis.EqEnergia;
end