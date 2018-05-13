function [  ] = Relatorio1( x,limite,erro )
%Desenvolvimento de uma função real de variável real em série de Taylor
%para a função x^2*sin(x)
%x é o valor que queremos calcular da função em x 
%limite e o número máximo de iterações que queremos que atinja

if(nargin==0) %se nao inserir nada
    x=1; 
end

if(nargin<2) %se inserir num
    limite=25;
    erro=0.000000123;
end

if(nargin<3) %se inserir num e limite
    erro=0.000000123;
end
    i=1;
    limite = abs(limite);
    iteracao=1;
    soma=0;
    errotaylor=50000;
    
while (iteracao < limite && errotaylor>erro && iteracao < 125)
    termo=((-1)^(iteracao-1))*(x^(2*iteracao+1))/factorial(2*iteracao-1);%calculo de cada termo da serie de taylor
    errotaylor=abs(termo/soma);
    soma=soma+termo; %soma dos termos calculados
    iteracao=iteracao+1;
    evolucao(i)=soma; %guardar a soma a cada etapa para depois mostrar a evolução no gráfico
    i=i+1;
end

fprintf('Iteracõess: %d \nErro: %d \nValor aproximado: %d\nValor exato: %d\n',iteracao-1,erro, soma,(x^2)*sin(x));
plot(evolucao,'*-') %mostra os varios valores do termo
hold on %retem o plot atual
plot(iteracao,(x^2)*sin(x),'O') %plot com o x= iteçao e y= ao valor exato
hold off %mostra os plots, agora juntos
legend('Valor da soma em cada iteração','Valor exato de x^2*sin(x)')
grid on
xlabel('x- Número de iterações')
ylabel('y - Valores')
axis([0 iteracao+1 min(evolucao)-abs(min(evolucao)*0.1) max(evolucao)+abs(max(evolucao)*0.1)]) %define axis x e y
end
