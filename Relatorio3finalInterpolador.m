function [] = Relatorio3final( valor )%ENTRAM Y EUROS

if (nargin == 0) valor=1; 
end

%valor de 1 euros em 2015 ao longo dos anos
x = [1960 1965 1970 1975 1980 1985 1990 1995 2000 2005 2010 2015];
y = [86.25 76.26 57.12 27.69 10.67 3.87 2.23 1.55 1.36 1.16 1.07 1.00];
y=y*valor; %multiplicar pelo valor que o utilizador quiser (euros)
x2=x-1960;     %transformação dos dados - mudança de variavel
y2=y-50;       %transformação dos dados - mudança de variavel

%calculo dos coeficientes do polinomio de Lagrange nas variaveis modificadas
l=lagrangePol(x2,y2);  
clf;
%figura nas variaveis originais mas utilizando os valores obtidos pelas variaveis modificadas
figure(1) %POLINOMIO INTERPOLADOR    
plot(x,y,'ko');
%para fazer o titulo
v = int2str(valor);
str = strcat('Polinomio Interpolador - Valor de €', v, ' atuais ao longo dos ultimos 55 anos.');
title(str);
xlabel('x- Data em Anos')
ylabel('y - Valores em Euros')
%desenhar a função, voltando as variaveis iniciais
%escolha das abcissas para desenhar a funçao
xx=1960:0.025:2015;
yy=50+polyval(l,xx-1960);
hold on;
plot(xx,yy,'g.');
end