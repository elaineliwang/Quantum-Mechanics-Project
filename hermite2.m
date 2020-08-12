function y = hermite(n,x);

%if size(x, 1) == 1;
%  x = x'; rot = 1;
%end;

ytem = zeros(length(x),length(x),1);
ytem(:,:,1) = ones(length(x),length(x), 1);
ytem(:,:,2) = 2*x;

if n == 0; y = ytem(:,:,1); return; end;
if n == 1; y = ytem(:,:,2); return; end;

if n > 1;

  m = 1;
  p = 2;

  for i = 2:n;
    ynew = 2*x.*ytem(:,:,p)-2*(i-1)*ytem(:,:,m);
    tem = m;
    m = p;
    p = tem; 
    ytem(:,:,p) = ynew;
  end

  y = ynew;

end;
