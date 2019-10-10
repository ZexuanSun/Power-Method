% The function to calculate conjugate complex roots
function [v,t]=cal_complex(x,A)
    x1=A*x;
    x2=-A*x1;
    B=[x1,x];
    mc=B\x2;
    a=-mc(1)/2;
    b=sqrt(mc(2)-a^2);
    y1=a-b*i;
    y2=a+b*i;
    % else
    %     y1=a+b*i;
    %     y2=a-b*i;
    % end
    t=y1;
    v=(x1-y2*x)/(y1-y2);
    % v1=(x1-y1*x)/(y2-y1);
    [vmax,c]=max(abs(v));
    v=v/v(c);
    v=denoise(v);
    % [vmax,c]=max(abs(v1));
    % v1=v1/v1(c);
    % v1(1)=0;
    % n=size(v1,1);
    % v2=zeros(n-1,1);
    % v2=v1(2:n);
    % v2=zao(v2);
    % for k=1:n-1
    %     if abs(v2(k))<1e-5
    %         v2(k)=0;
    %     end
    % end
end