function g = mrf_grad_log_gaussian_prior(T, sigma)
%Commpute prior
[m,n] = size(T);
a1 = (-1/sigma^2) * (T(1:m-1,:) - T(2:m,:));
%a1(m,:) = (-1/sigma^2) * (T(m,:) - T(m-1,:));
%a2 = exp((-1/(2*sigma^2)) * (T(1:m-1,:) - T(2:m,:)).^2);
%a2(m, :) = exp((-1/(2*sigma^2)) * (T(m,:) - T(m- 1,:)).^2);
b1 = (1/sigma^2) * (T(1:m-1,:) - T(2:m,:));
%b1(2:m,:) = (1/sigma^2) * (T(1:m-1,:) - T(2:m,:));
%b1(1,:) = (1/sigma^2) * (T(2,:) - T(1,:));
%b2(2:m,:) = exp(-1/(2*sigma^2)) * (T(1:m-1,:) - T(2:m,:)).^2;
%b2 = exp(-1/(2*sigma^2)) * (T(1:m-1,:) - T(2:m,:)).^2;
%b2(1,:) = exp(-1/(2*sigma^2)) * (T(2,:) - T(1,:)).^2;

c1 = (-1/sigma^2) * (T(:,1:n-1) - T(:,2:n));
%c1(:,n) = (-1/sigma^2) * (T(:,n) - T(:,n-1));
%c2 = exp(-1/(2*sigma^2)) * (T(:,1:n-1) - T(:,2:n)).^2;
%c2(:,N) = exp(-1/(2*sigma^2)) * (T(:,n) - T(:,n-1)).^2;
d1 = (1/sigma^2) * (T(:,1:n-1) - T(:,2:n));
%d1(:,2:n) = (1/sigma^2) * (T(:,1:n-1) - T(:,2:n));
%d1(:,n) = (1/sigma^2) * (T(:,2) - T(:,1));
%d2 = exp(-1/(2*sigma^2)) * (T(:,1:n-1) - T(:,2:n)).^2;
%d2(:,2:n) = exp(-1/(2*sigma^2)) * (T(:,1:n-1) - T(:,2:n)).^2;
%d2(:,n) = exp(-1/(2*sigma^2)) * (T(:,2) - T(:,1)).^2;

% Pad matricies with zeros for addition
a1(m,:) = 0;
%a2(m,:) = 0;
b1 = [zeros(1,n) ; b1];
%b2 = [zeros(1,n) , b2];
c1(:,n) = 0;
%c2(:,n) = 0;
d1 = [zeros(m,1) , d1];
%d2 = [zeros(m,1) , d2];

g = a1 + b1 + c1 + d1;
end

