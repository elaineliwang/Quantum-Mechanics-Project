function [M,m,MM] = testh(h,E)

  N = round((E-2*h)/(2*h))+5;

x = linspace(-1.5*E,1.5*E,200);
y = x;
[x,y]=meshgrid(x,y);

ll = 0;

aa = zeros(200,200);

for n=1:N

	for k=max(n-5,1):min(n+5,N)

%	if (abs(E-2*h*n-2*h*m-2) < 5*h) 

	  ll = ll + 1;

aa(:,:,ll) = ham2(h,n,x).*ham2(h,k,y);

end
end

MM = 0;

P = 100;

for j=1:P

c = randn(1,ll);

c = c/sqrt(sum(c.^2));

u = zeros(200);

for j=1:ll
	u = u + c(j)*aa(:,:,j);
end

MM = max(max(abs(u)))+MM;

end

MM = MM/P;

aaa=zeros(200,200);

for j=1:ll
	aaa=aaa+abs(aa(:,:,j)).^2;
end

aaa = sqrt(aaa);

M = max(max(aaa));

m = max(max(max(abs(aa))));



