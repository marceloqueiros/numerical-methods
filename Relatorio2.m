function xout = Relatorio2(xi,tol, nmax)
%devem ser introduzidos valores proximos do intervalo do brackplot
%funcao escolhida f(x) = x.^2 - 4*sin(x)

%xi valor de x onde começa o teste
%nmax repreenta o numero max de iteracoes
%tol tolerancia, erro com que se pretende calcular o valor

fprintf('Raizes da funcao f(x) = x.^2 - 4*sin(x) usando metodo de newton\n');

k=0; %contador numero de iteracoes

if nargin <3
    nmax=25; %numero de iterações se o utilizador nao introduzir nenhum valor
end

if nargin <2
    tol = 0.000001; %tolerancia se o utilizador nao introduzir nenhum valor
end


x=xi; %atribuir o valor xi a x
erro=1000; %erro inicial muito alto para entrar no ciclo

fprintf(' iter      x(k+1)                   f(x)               dfdx             erro\n'); %linha de cabecalho

while((abs(erro)>tol) && (k<=nmax))
    xis(k+1) = x; %vetor com as sucessivas aproximacoes ao valor da raiz da funcao
    fx = (x.^2 - 4*sin(x));  %fx toma o valor da funcao no ponto x
    yis(k+1) = fx; %vetor com o valor da funcao para cada aproximacao
    dfx = (2*x-4*cos(x)); %dfx toma o valor da derivada nesse ponto
    erro =-fx/dfx; %erro a cada iteracao
    fprintf('%3d  %18.10f       %12.3e       %12.3e     %12.3e\n',k,x,fx,dfx,erro); %mostrar no ecra os resultados de cada iteracao
    x = x+erro; %aproximacao ao valor da raiz
    %xout = x; %guardar parametro saida f(x)=0;
    k=k+1; %incrementar o contador
end
 
f = 'x.^2 - 4*sin(x)';
xi=fzero(f,xi); %obter o zero usando a funcao fzero do matlab
xout = [x xi]; %resultados obtidos, x ->metodo de newton || xi -> fzero

xfun = linspace(min(xis)-1,max(xis)+1); %intervalo em que a funcao vai ser representada no grafico adaptavel %1:0.5:3.5;
yfun =(xfun.^2 - 4*sin(xfun));
zero = zeros(size(xfun));

xlabel('x')
ylabel('y')
plot(xis, yis, 'k*') %plot dos pontos obtidos com o metodo de newton
hold on
plot(xfun, yfun, 'r', 'LineWidth', 1) %fazer plot a funcao inicial
legend('aproximacoes','f(x) = x.^2 - 4*sin(x)', 'location', 'Northwest')
plot(xfun, zero,'k', 'LineWidth', 1); %desenhar eixo dos XX
hold off

end