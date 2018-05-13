function [  ] = Relatorio3finalSegmentado(valor ) %ENTRAM Y EUROS

if (nargin == 0) valor=1;
end
%valor de 1 euros em 2015 ao longo dos anos
x = [1960 1965 1970 1975 1980 1985 1990 1995 2000 2005 2010 2015];
y = [86.25 76.26 57.12 27.69 10.67 3.87 2.23 1.55 1.36 1.16 1.07 1.00];
y=y*valor;%multiplicar pelo valor que o utilizador quiser (euros)
figure(2) %POLINOMIO INTERPOLADOR SEGMENTADO    
plot(x,y,'ko');
%para fazer o titulo
v = int2str(valor);
str = strcat('Polinomio Interpolador Segmentado - Valor de €', v, ' atuais ao longo dos ultimos 55 anos.');
title(str);
xlabel('x- Data em Anos')
ylabel('y - Valores em Euros')
xx=1960:0.025:2015; 
yy=spline(x,y,xx) %fazer as splines
hold on;
plot(xx,yy,'b.');%mostrar a das splines
yy=linterp(x,y,xx) %linear
plot(xx,yy,'g.'); %mostrar o linear
end

