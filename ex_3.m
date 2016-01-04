% Parameters
sig = 3;
eta = 0.1;

% Stripes
TS = toy_stripes(100,50, 25);
NS = add_sp_noise(TS, 0.1);
RS = denoising_grad_ascent(NS, sig, eta);
%waitforbuttonpress;
errS = calc_psnr(TS,RS);
imshow(mat2gray(RS));
%waitforbuttonpress;

% Checkeboard
TC = toy_checkerboard(100,50, [25 30]);
NC = add_sp_noise(TC, 0.1);
RC = denoising_grad_ascent(NC, sig, eta);
%waitforbuttonpress;
errC = calc_psnr(TC,RC);
imshow(mat2gray(RC));
%waitforbuttonpress;

% Image
TI = imread('la.png');
TI = double(TI);
NI = add_noise(TI, 25);
RI = denoising_grad_ascent(NI, sig, eta);
waitforbuttonpress;
errI = calc_psnr(TI,RI)
imshow(mat2gray(RI));