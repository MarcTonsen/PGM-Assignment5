%Stripes 
T = toy_stripes(40,20, 4);
%N = add_sp_noise(T, 0.1);
N = add_noise(T, 30);


sig = [0.01, 0.5, 1, 2, 3, 4, 5, 6, 7, 10, 15, 25, 50, 100];
mu = [0.1, 0.5, 1, 2, 5, 10, 12, 14, 15, 17, 20, 25, 50, 100];
for i = (1:10)
    for j = (1:10)
        R = denoising_grad_ascent_student(N, 10^(i-5), 10^(j-5), 1);
        err(i,j) = calc_psnr(T, R);
        %imshow(mat2gray(R));
        %waitforbuttonpress;
    end
end

[num idx] = max(err(:));
num
[x y] = ind2sub(size(err),idx)

R = denoising_grad_ascent_student(N, sig(x), mu(y), 1);
err = calc_psnr(T, R)
imshow(mat2gray(R));