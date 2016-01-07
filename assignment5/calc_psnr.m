function psnr = calc_psnr( T, N )
[m,n] = size(T);
err = ((T-N).^2)/(m*n);
err = sum(err(:));
psnr = 20 * log10(255/sqrt(err));
end

