% CLASE_02
% Optimizacion numerica en economía. Algoritmos en Matlab

% Algoritmo del gradiente descendiente
% Este algoritmo halla optimos locales, no globales.
% Buscamos puntos optimos absoluto

 % Para hallar el min absoluto de la funcion seno en un intervalo
[x,fval]=fminbnd('sin',0.2,pi)
% Para hallar el maximo con la funcion fminbnd, hallamos -f(x) y aplicamos
% fminbnd sobre esta funcion

% Tambien podemos usar la funcion fminsearch, pero esta funcion
% solo me permite hallar minimos locales

%linprog
f=[-10,-6,-4]'; %coefs de la funcion a maximizar cambiados los signos
A =[1,1,1;10,4,5;2,2,6]; % coefs de las inecuaciones
b=[100,600,300]'; % terminos independientes de la derecha
Aeq=[];beq=[]; % 
lb=[0 0 0]';ub=[]; % limite inferior y superior
% el corchete previo a linprog nos arrojará los resultados del problema
[x,fval,exitflag,output,lambda]=linprog(f,A,b,Aeq,beq,lb,ub)
% Si hubiese termino independiente en la funcion a optimizar, no
% considerarlo en el algoritmo y sumar dicho valor a la solucion

% El problema de los chalets (Problema de optimizacion lineal entera)
f=[-0.7;-1]'; %coefs de la funcion a maximizar cambiados los signos
A =[7 13;140 80]; % coefs de las inecuaciones
b=[91,1190]'; % terminos independientes de la derecha
Aeq=[];beq=[]; % 
intcon=[1,2] % para indicar las variables enteras
lb=[0 0 ]';ub=[]; % limite inferior y superior
[x,fval]=intlinprog(f,intcon,A,b,Aeq,beq,lb,ub)
% el corchete previo a linprog nos arrojará los resultados del problema
% Si emplearamos la funcion linprog con este problema, no obtendriamos los
% mismos resultados por redondeo

% Problema de la mochila, su resolucion optima la podemos obtener con el
% algoritmo anterior


% Programacion cuadratica
% Dada una cartera de activos, ¿que porcentaje de dinero debo invertir en
% cada activo?
% coefs de la funcion  cuadratica a maximizar
H=[0.04 0.03 -0.04; 0.03 0.09 0;0.04 0 0.16]'; 
f=[];
A =[]; % coefs de las inecuaciones
b=[]'; % terminos independientes de la derecha
Aeq=[0.03,0.05,0.07];beq=[0.04]; 
lb=[0 0 ]';ub=[]; % limite inferior y superior
[x,fval]=quadprog(H,f,A,b,Aeq,beq,lb,ub)


% Máxima verosimilitud
F=@(x)0.4*pdf('norm',x,-1,sqrt(0.5))
    +0.6*pdf('norm',x,2,sqrt(2))
fplot(F,[-4,6]),title('Mixtura de normales')


