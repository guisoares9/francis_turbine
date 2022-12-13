function [c, ceq] = restricao(x)    

    c = [];
    
    ceq = pow(x) - 100e6;
end