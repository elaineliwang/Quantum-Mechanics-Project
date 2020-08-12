function [m,m1,uu,u] = testh2(h,N,p,P,K)

  if (nargin < 5 ) 

    K = 200;

end

  E = h*( 2 + N );

x = linspace(-2*sqrt(E),2*sqrt(E),K);
y = x;
[x,y]=meshgrid(x,y);

aa = zeros(K,K);

for n=1:N+1
aa(:,:,n) = ham2(h,n-1,x).*ham2(h,N-n+1,y);
end


MM = 0;


if (nargin < 4)

P = 100;

end

mm = 0;

for j=1:P

c = randn(1,N+1);

c = c/sqrt(sum(c.^2));

u = zeros(K);

for j=1:N+1
	u = u + c(j)*aa(:,:,j);
end


mmm = trapz( y(:,1), (trapz(x(1,:),abs(u).^p, 2)) );

mmm = mmm^(1/p);

m1 = max(mm,mmm);

mm = mmm;

MM = mm + MM;

end
%m1 is random 
m1 = MM/P; 

[xx,m] = fminsearch(@(x)lpn(x,h,p),ones(1,N+1));
%m is the actual lp norm
m=1./m;

[m2,uu]=lpn(xx,h,p);



