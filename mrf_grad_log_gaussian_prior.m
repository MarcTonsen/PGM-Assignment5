function g = mrf_grad_log_gaussian_prior(T, sigma)
%Commpute prior
[m,n] = size(T);
a1 = (-1/sigma^2) * (T(1:m-1,:) - T(2:m,:));
%b1 = (1/sigma^2) * (T(1:m-1,:) - T(2:m,:));
b1 = -1 * a1;

c1 = (-1/sigma^2) * (T(:,1:n-1) - T(:,2:n));
%d1 = (1/sigma^2) * (T(:,1:n-1) - T(:,2:n));
d1 = -1 * c1;


% Pad matricies with zeros for addition
a1(m,:) = 0;
b1 = [zeros(1,n) ; b1];
c1(:,n) = 0;
d1 = [zeros(m,1) , d1];

g = a1 + b1 + c1 + d1;
end

