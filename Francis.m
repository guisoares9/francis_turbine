classdef Francis
    properties
        % Dados
        rho = 1000;     g = 9.81;
        mu = 0.001;     h = 100;
        eps = 0.025;    k = 0.1;
        LD = 180;
        beta_2 = degtorad(75);
        % Parametros
        d1 = []; d2 = []; r1 = []; r2 = []; w  = []; b  = [];
        % Vazao
        q = [];
    end
    methods
        function q = setVazao(self)
            q = vazao([self.d1 self.d2 self.r1 self.r2 self.w self.b]);
        end
        % Velocidade Media
        function vm = VM(self)
            v1 = 4*self.q/(pi*self.d1^2);
            v2 = 4*self.q/(pi*self.d2^2);
            vm = mean([v1 v2]);
        end
        % Funcao do Atrito
        function fric = f(self)
            d = mean([self.d1 self.d2]);
            fric = friction(self.rho*self.VM*d/self.mu, self.eps);
        end
        % Funcao Modular
        function ret = C(self, r)
            ret = self.q/(2*pi*self.b*r);
        end
        % Funcoes de Potencia (total, util, perdas)
        function wtotal = WTotal(self)
            wtotal = self.rho * self.h * self.g * self.q;
        end
        function wutil = WUtil(self)
            U2 = self.w*self.r2; U1 = self.w*self.r1;           
            wutil = self.rho * self.q * (U2^2 - U2*self.C(self.r2)/tan(self.beta_2) - U1*self.k*self.C(self.r1));
        end
        function wloss = WLoss(self)
            wloss  = self.f/2 * self.LD * self.VM^2 * self.rho * self.q;
        end
        % Funcao de Potencia (pow)
        function pwr = Power(self)
            U2 = self.w*self.r2; U1 = self.w*self.r1;  
            Vt1 = self.k*self.q/(2*pi*self.r1*self.b);
            pwr = (U2^2 - U2*self.C(self.r2)/tan(self.beta_2) - U1*Vt1)*self.q*self.rho;
        end
        % Funcao da Restricao (deve ser 0)
        function res = EqEnergia(self)
            res = eqEnergia([self.d1 self.d2 self.r1 self.r2 self.w self.b], self.q);
        end
        
    end
end