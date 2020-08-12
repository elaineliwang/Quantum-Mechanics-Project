function graph(h,N)
%N is the energy level
x = linspace(-10,10);
y = x;
[x,y] = meshgrid(x,y);
c = randn(1,N+1);
c = c/sqrt(sum(c.^2));
z = zeros(100);
for j = 1:10+1
z = z + c(j)*ham2(h,j-1,x).*ham2(h,N+1-j,y);
surf(x,y,z)
pause(0.5)
end
