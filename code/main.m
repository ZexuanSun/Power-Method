function [b,D]=main(A)
% b are the vector collecting the eigenvalues of matrix A 
% D are the corresponding eigenvectors of matrix A
tic
    is=0;
    o=diag(diag(A));
    if  norm(o-A)<1e-4
        is=1;
    end
    n=size(A,1);
    C=zeros(n,n,n-1);% matrix sequences to collect A after each iteration
    C(:,:,1)=A;
    D=[];
    b=[];
    d=[];
    Z=zeros(n,n);%collect the diagonal matrix of revised household transformation 
                 % in the form of vector
    q=0;
    po=0;
    
    if is==0
        for k=1:n
        %     C(k:n,k:n,k)

        [v,b(k),q]=power_method(C(k:n,k:n,k));% calculate the max eigenvalues
                                              % and corresponding eigenvectors
            if q==1
                po=k+1;
            %    m=size(v2,1);
            %    v3=zeros(m,1);
            %    v3=v2;
            %     q=0;
             end
             if k==po 
                b(k)=b(k-1)';
            %     if norm(v3) >1e-2
            %     v=v3;
            %     v3=[];
            %     end
             end

            [vo,a,Z(k:n,k)]=household(v); % get the household transformation
            %size(e,1)
            %n-k+1
            d(k)=a;
        %     A
        %     vo
            %Z(k:n,k)=e;
            A(k+1:n,k)=vo(2:n-k+1);%collect the househould transformation vectors
            t=diag(Z(k:n,k));
            C(k:n,k:n,k)=t*C(k:n,k:n,k)*t';
            w=a*C(k:n,k:n,k)'*vo;
            C(k:n,k:n,k)=C(k:n,k:n,k)-vo*w';% implement PAP*
            w=a*C(k:n,k:n,k)*vo;
            C(k:n,k:n,k)=C(k:n,k:n,k)-w*vo';
            C(k+1:n,k+1:n,k+1)=C(k+1:n,k+1:n,k);% log the next matrix
            %C(k+1:n,k+1:n,k+1)
            
            % start to calculate eigenvectors
            if k==1
                D=[D,v];
            else 
                for j=k-1:-1:1
                    y=[];
                    y(1)=1;
                    y(2:n-j+1)=A(j+1:n,j);
                    y=y';% recover the saved household transformation vector,
                         % note that here transpose is to transfer the vector 
                         % to column vector
                    v=cal_eigenvector(C(j:n,j:n,j),v,d(j),y,Z(j:n,j),b(k));%??????????v????n??
                end
                 D=[D,v];
            end
        end
        b=b';
        else
            b=diag(A);
            D=eye(n); % handle the situation of diagonal matrix, of course, 
                      % this situatio is quite easy
    end
toc
end