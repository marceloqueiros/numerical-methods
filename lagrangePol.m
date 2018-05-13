function [l, L] = lagrangePol(x,y)

%output l - polinomio de lagrange
%output L - coeficiente dos polinomios de lagrange

N=length(x)-1;
l=zeros(1 , length(x));
for m=1:N+1
    P=1;
    for k=1:N+1
        if k~=m
            P=conv(P,[1 -x(k)])/(x(m)-x(k));
        end
    end
    L(m,:)=P;
    l=l+y(m)*L(m,:);
end