# Power Method for Calculating Eigenvalues and Eigenvectors

This is a project I finished in the course Numerical Analysis (1), taught by 
Professor *Zhijian Yang* in 2017 fall. Just because I finished this project, Prof. Yang gave me 
100 in both theory and practice courses :). 

As we all know, power method is used to calculate the maximal modulus eigenvalue of a matrix,
which cannot be employed to calculate all eigenvalues of a matrix. Thus, I employed 
the method to reduce the order of matrix mentioned in *Numerical Linear Algebra* to handle the 
problem. Also, power method would fail if there are two eigenvalues having the same modulus. 
But this always happens since the existence of conjugate complex roots. I revised the power method
to solve the problem of conjugate complex roots based on an algorithm from *zhihu*, note that if there are two egienvalues with same modulus but they are not conjugate complex roots, my algorithm will not work. In order to calculate eigenvalues, which 
are conjugate complex roots, I also revised the household transformation, since the algorithm of household transformation
dose not hold true for complex roots. With the help of my friend, *Yilin Chen*, I solved this problem.

Note that since it is not convenient to demonstrate equations and the details of the whole 
algorithm here, I give these contents in **Algorithm.pdf**.

