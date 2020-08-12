N = 5:5:150;
h = 1./(1+ 2*N);
p = 2.5;
for j=1:30
m(j)=lp2(h(j),N(j),p);
end
plot(1./h,m,'r');
