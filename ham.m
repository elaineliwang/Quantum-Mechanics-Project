function ham = ham(h,n,x)

  ham = hermite(n,x./sqrt(h))'.*exp(-x.^2/(2*h));

ham = ham*(2.^n.*factorial(n)).^(-1/2).*(pi*h).^(-1/4);

