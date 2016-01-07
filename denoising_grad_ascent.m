function T = denoising_grad_ascent(N, sigma, eta)
iter = 2000;
postCurve = zeros(iter+1,1);
T = N;
postCurve(1) = denoising_lp(N, N, sigma);
for i = 1:iter
    g_gauss = denoising_grad_llh(T, N, sigma) + mrf_grad_log_gaussian_prior(T, sigma);
    T = T + eta * g_gauss;
    T(T>255) = 255;
    T(T<0) = 0;
    v = denoising_lp(T, N, sigma);
    postCurve(i+1) = v;
end

plot(postCurve(:,1));
%saveas(gcf,'LogPostCurve_gauss','png');

end

