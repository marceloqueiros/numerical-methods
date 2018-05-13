function [ I ] = simpson( a,b,n )
%a � o limite superior
%b � o limite inferior
%n � o n� de subintervalos desejados


%averiguar se n � par
if(mod(n,2) ~= 0)
    n=n+1;
end


h=(b-a)/n;

x=a:h:b;

fx=exp(sin(x));

I=0;


for i = 1 : 2 : (n-1)
    I = I + fx(i) + 4*fx(i+1) + fx(i+2);
end
I=(h/3)*I;
