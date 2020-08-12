function [M,MM] = testh1(h,N)

  P = 200;

  E = h*( 2 + N );

x = linspace(-2*sqrt(E),2*sqrt(E),P);
y = x;
[x,y]=meshgrid(x,y);

aa = zeros(P,P);

for n=1:N+1
aa(:,:,n) = ham2(h,n-1,x).*ham2(h,N-n+1,y);
end


MM = 0;

PP = 100;

for j=1:PP

c = randn(1,N+1);

c = c/sqrt(sum(c.^2));

u = zeros(P);

for j=1:N
	u = u + c(j)*aa(:,:,j);
end

MM = max(max(abs(u)))+MM;

end

MM = MM/PP;

aaa=zeros(P,P);

for j=1:N
	aaa=aaa+abs(aa(:,:,j)).^2;
end

aaa = sqrt(aaa);

M = max(max(aaa));




