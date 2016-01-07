function lp = denoising_lp( T, N, sigma )
%Compute value of log-posterior
A = ((-1/(2*sigma^2)) * (N - T).^2);
lh = sum(A(:));

[m,n] = size(T);
H = (-1/(2*sigma^2)) * (T(1:m-1,:) - T(2:m,:)).^2;
V = (-1/(2*sigma^2)) * (T(:,1:n-1) - T(:,2:n)).^2;
H = sum(H(:));
V = sum(V(:));
p = H + V;

lp = lh + p;

end

