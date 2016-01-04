function g = mrf_grad_log_student_prior(T, sigma, alpha)
[m,n] = size(T);

a = (1/sigma^2) * (T(1:m-1,:) - T(2:m,:));
b = 1 + (1/ (2 * sigma^2)) * (T(1:m-1,:) - T(2:m,:));
H1 = -1 * alpha * a ./ b;
H2 = -1 * H1;

a = (1/sigma^2) * (T(:,1:n-1) - T(:,2:n));
b = 1 + (1/ (2 * sigma^2)) * (T(:,1:n-1) - T(:,2:n));
V1 = -1 * alpha * a ./ b;
V2 = -1 * V1;

%Pad matricies with zeros for addition
H1(m,:) = 0;
H2 = [zeros(1,n) ; H2];
V1(:,n) = 0;
V2 = [zeros(m,1) , V2];

g = H1 + H2 + V1 + V2;

end

