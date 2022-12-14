clc
clear
close all

paramsDefault = [7.3    7.3    4.2    8.37    3.69    2.74];
params = paramsDefault;
var = 50;
x_vec = [];
y_vec = [];

for i = 1:6

    x = linspace((1-var/100)*paramsDefault(i), (1+var/100)*paramsDefault(i));
    x_vec = [x_vec; x];
    rend = [];
    for j = 1:length(x) 
        params(i) = x(j);
        
        francis = setFrancis(params); 
        francis.q = francis.setVazao;
        if francis.q < 0
            rend = [rend 0];
            continue;
        end       

        % Eficiencia
        Wtotal = francis.WTotal;
        Wutil = francis.WUtil;
        Wloss = francis.WLoss;
        
        if Wtotal < Wutil
            rend = [rend 0];
            continue;
        end      

        if Wutil < 90e6
            rend = [rend 0];
            continue;
        end      
        
        rend = [rend Wutil/(Wutil+Wloss)];
    end    
    
    y_vec = [y_vec; rend];
    
    params = paramsDefault;
end


subplot(3,2,1), hold on, grid on
plot(x_vec(1,:),y_vec(1,:))
title('D1')

subplot(3,2,2), hold on, grid on
plot(x_vec(2,:),y_vec(2,:))
title('D2')

subplot(3,2,3), hold on, grid on
plot(x_vec(3,:),y_vec(3,:))
title('R1')

subplot(3,2,4), hold on, grid on
plot(x_vec(4,:),y_vec(4,:))
title('R2')

subplot(3,2,5), hold on, grid on
plot(x_vec(5,:),y_vec(5,:))
title('W')

subplot(3,2,6), hold on, grid on
plot(x_vec(6,:),y_vec(6,:))
title('B')