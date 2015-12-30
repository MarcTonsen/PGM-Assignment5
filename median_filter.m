function T = median_filter( N, nsize )
%Medianfilter, n must be odd
[m,n] = size(N);
l = (nsize - 1)/2;
T = N;

for i = (1:m)
    for j = (1:n)
        a = max(1, i - l);
        b = min(m, i + l);
        c = max(1, j - l);
        d = min(n, j + l);
        w = N(a : b, c : d);
        med = median(w(:));
        T(i,j) = med;
    end
end



end

