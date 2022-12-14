classdef Francis
    properties
        rho = 1000;     g = 9.81;
        mu = 0.001;     h = 100;
        eps = 0.025;   k = 0.1;
        LD = 180;
        beta_2 = degtorad(75);
        d1 = -1; d2 = -1;    
        r1 = -1; r2 = -1;
        w  = -1; b  = -1;
    end
    methods
        % Velocidade Media
        function vm = VM(obj, q)
            v1 = 4*q/(pi*obj.d1^2);
            v2 = 4*q/(pi*obj.d2^2);
            vm = mean([v1(q) v2(q)]);
        end
        % Funcao do Atrito
        function fric = f(obj, q)
            fric = friction(obj.rho*obj.vm(q)*d/obj.mu, obj.eps);
        end
        % Funcao Modular
        function ret = C(obj, q, r)
            ret = q/(2*pi*obj.b*r);
        end
        function wtotal = WTotal(obj, q)
            wtotal = obj.rho * obj.h * obj.g * q;
        end
        function wutil = WUtil(obj, q)
            U2 = obj.w*obj.r2; U1 = obj.w*obj.r1;
            % Modularizacao            
            wutil = obj.rho * q * (U2^2 - U2*obj.C(obj,q,obj.r2)/tan(obj.beta_2) - U1*obj.k*obj.C(obj,q,obj.r1));
        end
    end
end