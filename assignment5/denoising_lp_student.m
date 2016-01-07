function lp = denoising_lp_student( T, N, sigma, alpha )
%Compute value of log-posterior for student prior
A = ((-1/(2*sigma^2)) * (N - T).^2);
lh = sum(A(:));

[m,n] = size(T);
H = -alpha * log(1 + (1/(2*sigma^2)) * (T(1:m-1,:) - T(2:m,:)).^2);
V = -alpha * log(1 + (1/(2*sigma^2)) * (T(:,1:n-1) - T(:,2:n)).^2);
H = sum(H(:));
V = sum(V(:));
p = H + V;

lp = lh + p;

end