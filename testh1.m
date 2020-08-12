function [M,m,MM] = testh1(h,N)

  E = h*( 2 + N );

x = linspace(-1.5*E,1.5*E,500);
y = x;
[x,y]=meshgrid(x,y);

aa = zeros(500,500);

for n=1:N+1
aa(:,:,n) = ham2(h,n-1,x).*ham2(h,N-n+1,y);
end


MM = 0;

P = 100;

for j=1:P

c = randn(1,N+1);

c = c/sqrt(sum(c.^2));

u = zeros(500);

for j=1:N
	u = u + c(j)*aa(:,:,j);
end

MM = max(max(abs(u)))+MM;

end

MM = MM/P;

aaa=zeros(500,500);

for j=1:N
	aaa=aaa+abs(aa(:,:,j)).^2;
end

aaa = sqrt(aaa);

M = max(max(aaa));

m = max(max(max(abs(aa))));



