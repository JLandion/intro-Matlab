% Primera clase de computacional (repaso Matlab con activos)

% Sea un activo tal que: N(0.12,0,2^2)
% 0.12 = rentabilidad ; 0.2 = volatilidad
% ¿Cual es la prob de que el año que viene este activo 
% me de una rentabilidad superior al 14%?
cdf('norm',0.14,0.12,0.2) % 53.98%

%Distr. lognormal de los precios
p = @(x)pdf('logn',x,0.05,0.4) %p1=1.5
fplot(p,[0,4]),title('Distribucion Normal')
% Hallar la prob. de que el precio de un año este
% comprendido entre 1 y 2
cdf('logn',2,0.05+log(1.5),0.4)-cdf('logn',1,0.05+log(1.5),0.4)


% Opciones de compra o call
% Da al poseedor el derecho a comprar un activo subyacente 
% por una cantidad E(precio de ejercicio) en un momento T
% ¿Cual es el valor justo del call?
% Max(P-E,0)  P=valor del bien en el momento T
%1/(1+r) mean[max(P-E,0)]
% Valoración de riesgo neutro: Black Scholes Merton

% Empleando Montecarlo
E=10 ; r=0.1 ; % r = tipo libre de riesgo
sigma = 0.2; T = 251;
valor_vencimiento=[];
for i=1:1000
    S=[];S(1)=10; % S(1) = valor inicial
    for t=1:T
        S(t+1)=S(t) + r/252*S(t)+S(t)*sigma/sqrt(252)*randn;
    end
    valor_vencimiento=[valor_vencimiento max(S(252)-E,0)];
end
call=1/(1+r)*mean(valor_vencimiento) %1.3451 precio justo del call


% Simulacion de crisis financieras. Distribucion de Poisson

E=10 ; r = 0.1 ; sigma=0.2 ; T=251 ; lambda = 1/251;
valor_vencimiento=[];
for i=1:1000
    S=[];S(1)=10;salto=[]; % S(1) = valor inicial
    for t=1:T
        salto(t)=icdf('poisson',rand,lambda)*0.05*S(t);
        S(t+1)=S(t) + r/252*S(t)+S(t)*sigma/sqrt(252)*randn-salto(t);
    end
    valor_vencimiento=[valor_vencimiento max(S(252)-E,0)];
end
call=1/(1+r)*mean(valor_vencimiento) %1.3451 precio justo del call
