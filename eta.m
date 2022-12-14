function custo = eta(x)    
    % Dados
    francis = setFrancis(x);       
    francis.q = francis.setVazao;
    
    % wtotal = WTotal(obj, q);    
    Wutil  = francis.WUtil;
    Wloss  = francis.WLoss;
    custo = 1 - Wutil/(Wutil+Wloss);   
end