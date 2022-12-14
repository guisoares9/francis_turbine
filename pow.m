function pwr = pow(x)    
    % Dados
    francis = setFrancis(x);       
    francis.q = francis.setVazao;    
    pwr = francis.Power;
end