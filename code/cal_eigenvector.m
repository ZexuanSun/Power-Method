% The function used to calculate eigenvectors during iteration
function y=cal_eigenvector(A,x,d,a,da,te) 
% A is a matrix
% x is a vector
% d and a are two parameters of household transformation
% d is the coefficient
    k=size(x,1);
    n=size(A,1);
    z=zeros(k+1,1);
    z(2:k+1)=x;
    z(1)=-A(1,2:n)*x/(A(1,1)-te);%????????????????????
    w=d*z'*a;
    z=z-a*w';% household transformation
    z=diag(da)'*z;
    y=z;
    y=denoise(y);
end