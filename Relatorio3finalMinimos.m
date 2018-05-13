function [  ] = Relatorio3finalMinimos(valor, grau ) %ENTRAM Y EUROS

if (nargin < 2) valor=1; grau=6;
end
%valor de 1 euros em 2015 ao longo dos anos
x = [1960 1965 1970 1975 1980 1985 1990 1995 2000 2005 2010 2015];
y = [86.25 76.26 57.12 27.69 10.67 3.87 2.23 1.55 1.36 1.16 1.07 1.00];
y=y*valor;%multiplicar pelo valor que o utilizador quiser (euros)
figure(3) %POLINOMIO MINIMOS QUADRADOS 
plot(x,y,'ko');
%para fazer o titulo
v = int2str(valor);
str = strcat('Minimos Quadrados - Valor de €', v, ' atuais ao longo dos ultimos 55 anos.');
title(str);
xlabel('x- Data em Anos')
ylabel('y - Valores em Euros')
%para fazer o cálculo dos minimos quadrados
c = polyfit(x,y,grau); 
%para desenhar
xfit=linspace(min(x), max(x),100000);
yfit=polyval(c, xfit); 
hold on;
plot(xfit,yfit,'g.');

end