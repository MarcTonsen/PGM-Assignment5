function T = denoising_grad_ascent(N, sigma, eta)
iter = 2000;
postCurve = zeros(iter+1,1);
T = N;
postCurve(1) = denoising_lp(N, N, sigma);
for i = 1:iter
    v = denoising_lp(T, N, sigma);
    g = denoising_grad_llh(T, N, sigma) + mrf_grad_log_gaussian_prior(T, sigma);
    T2 = T + eta * g;
    v2 = denoising_lp(T2, N, sigma);
    postCurve(i+1) = v2;
    if v2 > v
        T = T2;
    else
        display(i);
        break;
    end
end

plot(postCurve(:,1));

end

