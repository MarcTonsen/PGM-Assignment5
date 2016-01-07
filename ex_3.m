% Parameters
sig = 10;
eta = 0.1;

% Stripes
TS = toy_stripes(100, 50, 25);
NS = add_sp_noise(TS, 0.1);
RS = denoising_grad_ascent(NS, sig, eta);
imwrite(mat2gray(RS), 'ex3_stripes_mrf_gaussian_filter.png');
errS = calc_psnr(TS,RS) 

NS2 = median_filter(NS, 5);
RS2 = denoising_grad_ascent(NS2, sig, eta);
imwrite(mat2gray(RS2), 'ex3_stripes_median_into_mrf_gaussian_filter.png');
errS2 = calc_psnr(TS,RS2) 

% Checkeboard
TC = toy_checkerboard(100,50, [25 30]);
NC = add_sp_noise(TC, 0.1);
RC = denoising_grad_ascent(NC, sig, eta);
imwrite(mat2gray(RC), 'ex3_checker_mrf_gaussian_filter.png');
errC = calc_psnr(TC,RC)

NC2 = median_filter(NC, 5);
RC2 = denoising_grad_ascent(NC2, sig, eta);
imwrite(mat2gray(RC2), 'ex3_checker_median_into_mrf_gaussian_filter.png');
errC2 = calc_psnr(TC,RC2)

% Image
TI = imread('la.png');
TI = double(TI);
NI = add_noise(TI, 25);
RI = denoising_grad_ascent(NI, sig, eta);
imwrite(mat2gray(RI), 'ex3_image_mrf_gaussian_filter.png');
errI = calc_psnr(TI,RI)

NI2 = median_filter(NI, 5);
RI2 = denoising_grad_ascent(NI2, sig, eta);
imwrite(mat2gray(RI2), 'ex3_stripes_median_into_mrf_gaussian_filter.png');
errI2 = calc_psnr(TI,RI2)