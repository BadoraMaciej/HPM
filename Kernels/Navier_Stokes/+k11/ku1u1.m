function [K] = ku1u1(x, y, xp, yp, hyp, i)

logsigma = hyp(1);
logthetax = hyp(2);
logthetay = hyp(3);

n_x = size(x,1);
n_y = size(y,1);
n_xp = size(xp,1);
n_yp = size(yp,1);

x = repmat(x,1,n_xp);
y = repmat(y,1,n_yp);
xp = repmat(xp',n_x,1);
yp = repmat(yp',n_y,1);

switch i


case 0

K=exp(1).^(logsigma+(-2).*logthetay+(-1/2).*exp(1).^((-1).*logthetax).*(x+ ...
  (-1).*xp).^2+(-1/2).*exp(1).^((-1).*logthetay).*(y+(-1).*yp).^2).*(exp( ...
  1).^logthetay+(-1).*(y+(-1).*yp).^2);


case 1 % logsigma

K=exp(1).^(logsigma+(-2).*logthetay+(-1/2).*exp(1).^((-1).*logthetax).*(x+ ...
  (-1).*xp).^2+(-1/2).*exp(1).^((-1).*logthetay).*(y+(-1).*yp).^2).*(exp( ...
  1).^logthetay+(-1).*(y+(-1).*yp).^2);


case 2 % logthetax

K=(1/2).*exp(1).^(logsigma+(-1).*logthetax+(-2).*logthetay+(-1/2).*exp(1) ...
  .^((-1).*logthetax).*(x+(-1).*xp).^2+(-1/2).*exp(1).^((-1).*logthetay).* ...
  (y+(-1).*yp).^2).*(x+(-1).*xp).^2.*(exp(1).^logthetay+(-1).*(y+(-1).*yp) ...
  .^2);


case 3 % logthetay

K=(-1/2).*exp(1).^(logsigma+(-3).*logthetay+(-1/2).*exp(1).^((-1).* ...
  logthetax).*(x+(-1).*xp).^2+(-1/2).*exp(1).^((-1).*logthetay).*(y+(-1).* ...
  yp).^2).*(2.*exp(1).^(2.*logthetay)+(-5).*exp(1).^logthetay.*(y+(-1).* ...
  yp).^2+(y+(-1).*yp).^4);


otherwise
        
        K = zeros(n_x, n_xp);
end

end
