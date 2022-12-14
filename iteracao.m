clc
close all

% Parametros para otimizar
% 3.5946    3.8065    2.0638    6.3545    3.9569    0.9353
params = [6.0237    6.0237    2.1427    2.6765   27.4778    0.1043];
francis = setFrancis(params);       
francis.q = francis.setVazao;

Q = francis.q
power = francis.Power

% Eficiencia
Wtotal = francis.WTotal
Wutil = francis.WUtil
Wloss = francis.WLoss

rendimento = Wutil/(Wutil+Wloss)