%Stripes 
T = toy_stripes(40,20, 4);
%N = add_sp_noise(T, 0.1);
N = add_sp_noise(T, 20);


sig = [0.1, 0.5, 1, 2, 5, 10, 15, 25, 50, 100];
mu = [0.1, 0.5, 1, 2, 5, 10, 15, 25, 50, 100];
for i = size(sig)
    for j = size(mu)
        R = denoising_grad_ascent_student(N, i, j, 1);
        err(i,j) = calc_psnr(T, R);
    end
end

[num idx] = min(err(:));
num
[x y] = ind2sub(size(err),idx)

R = denoising_grad_ascent_student(N, sig(x), mu(y), 1);
imshow(mat2gray(R));