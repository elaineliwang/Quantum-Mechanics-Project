function  [lp2] = lp2(h,N,p)
K = 1000;
E = h*( 1 + 2*N );
x = linspace(-2*sqrt(E),2*sqrt(E),K);
u = ham(h,N,x);
m = trapz(x,abs(u).^p);
lp2 = m.^(1/p);