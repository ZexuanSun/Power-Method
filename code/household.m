%revised household transformation
function [v,a,t]=household(x)
% a is the coefficient
% v is the vector
% t is the diagonal of diagonal matrix
n=length(x);
im=imag(x);
% x1=abs(x);
% D=diag(x'./x1');
% y=D*x;
%y=y-imag(y)*i;
    if n>1
        D=eye(n);
        x1=abs(x);
        for k=1:n
            if norm(x(k))>1e-4
                    D(k,k)=x(k)'/abs(x(k));
                end
        end
        y=D*x;
        b=max(y);
        y=y/b;
        c=dot(y(2:n),y(2:n));
        v(2:n)=y(2:n);
        v=v';
        if c==0
            a=0;
        else
            d=sqrt(y(1)^2+c);
            if y(1)<=0
                v(1)=y(1)-d;
            else
                v(1)=-c/(y(1)+d);
            end
            a=2*v(1)^2/(c+v(1)^2);
            v=v/v(1);
            t=diag(D);
        end
        else
            v=0;
            a=x;
            t=1;
    end
end
