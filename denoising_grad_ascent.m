function T = denoising_grad_ascent(N, sigma, eta)
iter = 2000;
T = N;
for i = (1:2000)
    v = denoising_lp(T, N, sigma);
    g = denoising_grad_llh(T, N, sigma) + mrf_grad_log_gaussian_prior(T, sigma);
    T2 = T + g ./ eta;
    v2 = denoising_lp(T2, N, sigma);
    if v2 > v
        T = T2;
    else
        break;
    end
end

end

