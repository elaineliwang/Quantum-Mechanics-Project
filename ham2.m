function ham2 = ham2(h,n,x)

  ham2 = hermite2(n,x./sqrt(h))'.*exp(-x.^2/(2*h));

ham2= ham2*(2.^n.*factorial(n)).^(-1/2).*(pi*h).^(-1/4);

