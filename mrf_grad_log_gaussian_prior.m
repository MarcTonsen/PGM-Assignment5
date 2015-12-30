function g = mrf_grad_log_gaussian_prior(T, sigma)
%Commpute prior
[m,n] = size(T);
a1 = (-1/sigma^2) * (T(1:m-1,:) - T(2:m,:));
a2 = exp((-1/(2*sigma^2)) * (T(1:m-1,:) - T(2:m,:)).^2);
b1 = (1/sigma^2) * (T(1:m-1,:) - T(2:m));
b2 = exp(-1/(2*sigma^2)) * (T(1:m-1,:) - T(2:m)).^2;

c1 = (-1/sigma^2) * (T(:,1:m-1) - T(:,2:m));
c2 = exp(-1/(2*sigma^2)) * (T(1:m-1,:) - T(:,2:m)).^2;
d1 = (1/sigma^2) * (T(:,1:m-1) - T(:,2:m));
d2 = exp(-1/(2*sigma^2)) * (T(1:m-1,:) - T(:,2:m)).^2;

g = a1./a2 + b1./b2 + c1./c2 + d1./d2;
end

