% revised power_method
function [v,t,q]=power_method(A)
% v is eigenvector, t is eigenvalue,
% q is the flag used to determine if the 
% function cal_complex should be employed

    N=10000; % set the max number of iterations to distinguish conjugate complex root
    q=0;
    n=size(A,1);
    u1=ones(n,1);
    u2=zeros(n,1);
    u0=u1;
    num=0;
    k=0;
    v2=zeros(n-1,1);
    % v3=[];
    % k1=norm(u2-u1);
    is=0;
    while norm(u2-u1)>1e-12
        u1=u0;
        y=A*u1;
        [vmax,i]=max(abs(y));%retain the orientation of eigenvector
        u2=y/y(i);
        u0=u2;
        k=k+1;
        if k>N && norm(u2-u1)>1e-4
            is=1;
            break;
        end
    %if num==20 && norm(u2-u1)>1e-8norm(u2-u1)
    % k2=norm(u2-u1);
    %norm(u2-u1)
    % u2-u1
    % u1 
    % u2
    % if abs(k2-k1)<1e-10
    %     num=num+1;
    % end
    % k1=k2;
    % if num==20 && k1>1e-13
    %     break;
    % end
    end
    v=denoise(u0);%denoise
    t=y(i);
    if is==1
        [v,t]=cal_complex(u1,A);
        q=1;
    end
end