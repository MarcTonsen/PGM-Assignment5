function T = denoising_grad_ascent(N, sigma, eta)
iter = 2000;
T = N;
for i = 1:iter
    v = denoising_lp(T, N, sigma);
    g = denoising_grad_llh(T, N, sigma) + mrf_grad_log_gaussian_prior(T, sigma);
    T2 = T + eta * g;
    v2 = denoising_lp(T2, N, sigma);
    if v2 > v
        T = T2;
    else
        break;
    end
end

end

