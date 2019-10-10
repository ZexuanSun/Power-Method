% The function for denoising
function y=denoise(x)
    n=length(x);
    r=real(x);
    f=imag(x);
    for k=1:n
       if abs(r(k))<1e-4
           r(k)=0;
       end
       if abs(f(k))<1e-4
           f(k)=0;
       end
    end
    y=r+i*f;
end