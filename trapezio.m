function [I] = trapezio( a,b,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
h=(b-a)/n;
x=a:h:b;
f=exp(sin(x));
I=0;
I=I+f(1)+f(n+1);
%para n
for i=2:n
    I=I+2*f(i);
end
I=(h/2)*I;
erro=((b-a)/12)*(h^2)*2;
end

