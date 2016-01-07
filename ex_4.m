% Parameters
sig = 10;
eta = 0.1;
alpha = 1;

% Stripes
TS = toy_stripes(100,50, 25);
NS = add_sp_noise(TS, 0.1);
RS = denoising_grad_ascent_student(NS, sig, eta, alpha);
waitforbuttonpress;
errS = calc_psnr(TS,RS);
errSN = calc_psnr(TS,NS);
imshow(mat2gray(RS));
waitforbuttonpress;
imwrite(RS/255,'ex4_stripes_mrf_student_filtered.png');

% Checkerboard
TC = toy_checkerboard(100,50, [25 30]);
NC = add_sp_noise(TC, 0.1);
RC = denoising_grad_ascent_student(NC, sig, eta, alpha);
waitforbuttonpress;
errC = calc_psnr(TC,RC);
errCN = calc_psnr(TC,NC);
imshow(mat2gray(RC));
waitforbuttonpress;
imwrite(RC/255,'ex4_checker_mrf_student_filtered.png');

% Image
TI = imread('la.png');
TI = double(TI);
NI = add_noise(TI, 25);
RI = denoising_grad_ascent_student(NI, sig, eta, alpha);
waitforbuttonpress;
errI = calc_psnr(TI,RI);
errIN = calc_psnr(TI,NI);
imshow(mat2gray(RI));
waitforbuttonpress;
imwrite(RI/255,'ex4_image_mrf_student_filtered.png');

display('PSNR (noisy) for stripes, checkerboard, image:');
display([errSN errCN errIN]);
display('PSNR (denoised) for stripes, checkerboard, image:');
display([errS errC errI]);