function [ ] = Relatorio4(n,a,b)
%a é o limite superior
%b é o limite inferior
%n é o nº de subintervalos desejados
%a função não polinmal escolhida foi: exp(sin(x))

if(nargin==0) %se nao inserir nada
    a=0;
    b=1;
    n=10;
end

if(nargin<2) %se inserir num
    a=0;
    b=1;
end

if(nargin<3) %se inserir num e limite
    b=a+1;
end

if( b<=a)
    b=a+1;
end   


x = linspace(a,b); %cria vetor com 100 pontos de 'a' a b
y = exp(sin(x)); %função usada
area(x,y) %preenche a figura com a área delimitada por x e y

evolucaotrapezio(1)=trapezio(a,b,1); %valor pela regra dos trapezios para 1 intervalo
evolucaotrapezio(2)=trapezio(a,b,2); %valor pela regra dos trapezios para 2 intervalos
evolucaotrapezio(3)=trapezio(a,b,4); %valor pela regra dos trapezios para 4 intervalos
evolucaotrapezio(4)=trapezio(a,b,8); %valor pela regra dos trapezios para 8 intervalos
evolucaotrapezio(5)=trapezio(a,b,n); %valor pela regra dos trapezios para o numero de intervalos introduzido


funcao=@(x) (exp(sin(x))); 
fprintf('Limite inferior: %d \nLimite superior: %d \nNúmero de subintervalos: %d\n',a,b,n);

fprintf('------------Regra dos trapézios------------\n');
fprintf('1 subintervalo: %d \nErro: %d \n\n2 subintervalos: %d \nErro: %d \n\n4 subintervalo: %d\nErro: %d \n\n8 subintervalos: %d\nErro: %d \n\n%d subintervalos: %d\nErro: %d \n\n',evolucaotrapezio(1),abs(integral(funcao,a,b)-evolucaotrapezio(1)),evolucaotrapezio(2),abs(integral(funcao,a,b)-evolucaotrapezio(2)), evolucaotrapezio(3),abs(integral(funcao,a,b)-evolucaotrapezio(3)),evolucaotrapezio(4),abs(integral(funcao,a,b)-evolucaotrapezio(4)),n,evolucaotrapezio(5),abs(integral(funcao,a,b)-evolucaotrapezio(5)));
if(mod(n,2) ~= 0)
    n=n+1;
end
evolucaosimpson(1)=simpson(a,b,2); %valor pela regra de simpson para 2 intervalos
evolucaosimpson(2)=simpson(a,b,4); %valor pela regra de simpson para 4 intervalos
evolucaosimpson(3)=simpson(a,b,8); %valor pela regra de simpson para 8 intervalos
evolucaosimpson(4)=simpson(a,b,n); %valor pela regra de simpson para o numero de intervalos introduzido

fprintf('-------------------------------------------\n');
fprintf('------------  Regra de Simpson ------------\n');
fprintf('Nº de subintervalos para fórmula de Simpson: %d\n',n);
fprintf('2 subintervalos: %d \nErro: %d \n\n4 subintervalos: %d\nErro: %d \n\n8 subintervalos: %d\nErro: %d \n\n%d subintervalos: %d\nErro: %d \n\n',evolucaosimpson(1),abs(integral(funcao,a,b)-evolucaosimpson(1)),evolucaosimpson(2),abs(integral(funcao,a,b)-evolucaosimpson(2)), evolucaotrapezio(3),abs(integral(funcao,a,b)-evolucaosimpson(3)),n,evolucaotrapezio(4),abs(integral(funcao,a,b)-evolucaosimpson(4)));
fprintf('-------------------------------------------\n');
fprintf('Valor usando função matlab: %d\n', integral(funcao,a,b)); %suspeitamos que a função integral do matlab usa a regra dos trapezios
end

