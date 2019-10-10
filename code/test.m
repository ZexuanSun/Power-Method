% test the performance of my function, 
% and compare the results with those of the MATLAB function eig


n = 20;
% the order of random matrix

A=rand(n);
[v,t]=main(A);
[V,D]=eig(A);
z=sort(diag(D),'descend');
v= sort(v,'descend');

error=abs(z-v);
num=0;
condi=norm(A)*norm(inv(A)); %calculate condition number


num_correct = sum(error < 1e-3)


