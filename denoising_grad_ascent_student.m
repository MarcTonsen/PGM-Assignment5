function T = denoising_grad_ascent_student(N, sigma, eta, alpha)
iter = 2000;
postCurve = zeros(iter+1,1);
T = N;
grad_image = mrf_grad_log_student_prior(N, sigma, alpha);
%imshow(mat2gray(grad_image));
%saveas(gcf,'GradImage','png');
postCurve(1) = denoising_lp_student(N, N, sigma, alpha);
for i = 1:iter
    g_student = denoising_grad_llh(T, N, sigma) + mrf_grad_log_student_prior(T, sigma, alpha);
    T = T + eta * g_student;
    T(T>255) = 255;
    T(T<0) = 0;
    v = denoising_lp_student(T, N, sigma, alpha);
    postCurve(i+1) = v;
end

plot(postCurve(:,1));
saveas(gcf,'LogPostCurve_student','png');

end