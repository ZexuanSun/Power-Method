# Notes

**cal_complex.m**: The function to calculate eigenvalues that are conjugate complex roots.

**cal_eigenvector.m**: The function used to calculate eigenvectors during iteration.

**denoise.m**: The function for denoising. The function is mainly used to improve the 
precision of the whole program.

**household.m**: The function of revised household transformation.

**power_method.m**: The function of revised power method.

**main.m**: The function of calculating eigenvalues and corresponding eigenvectors of a certain
matrix. All the functions aforementioned serve for the implementation of this function.

**test.m**: The codes to test the performance of the algorithm and compare the results with MATLAB
function *eig*. Note that as the order of matrix increases, the precision of the algorithm will decrease.
And I chose matrices with random entries for test, since the possibility of such matrices having eigenvalues with same modulus
but are not conjugate complex roots is almost zero. That's why later, people use QR and other methods to calculate
the eigenvalues and eigenvectors.


Some comments are given in the codes, also. If you have any questions, feel free to contact me.