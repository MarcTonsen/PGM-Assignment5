sigma = 10;
eta = 0.1;
alpha = 1;

% Stripes
TS = toy_stripes(100,50, 25);
NS = add_noisy_stripe(TS,30,20);
RS_gauss = denoising_grad_ascent(NS,sigma,eta);
RS_student = denoising_grad_ascent_student(NS,sigma,eta,alpha);
imshow(mat2gray(NS));
%waitforbuttonpress;
imshow(mat2gray(RS_gauss));
%waitforbuttonpress;
imshow(mat2gray(RS_student));
%waitforbuttonpress;
%imwrite(NS/255,'ex5_stripes_noise.png');
%imwrite(RS_gauss/255,'ex5_stripes_mrf_gaussian_filtered.png');
%imwrite(RS_student/255,'ex5_stripes_mrf_student_filtered.png');

% Checkerboard
TC = toy_checkerboard(100,60, [25 30]);
NC = add_noisy_stripe(TC,30,20);
RC_gauss = denoising_grad_ascent(NC,sigma,eta);
RC_student = denoising_grad_ascent_student(NC,sigma,eta,alpha);
imshow(mat2gray(NC));
%waitforbuttonpress;
imshow(mat2gray(RC_gauss));
%waitforbuttonpress;
imshow(mat2gray(RC_student));
%waitforbuttonpress;
%imwrite(NC/255,'ex5_checker_noise.png');
%imwrite(RC_gauss/255,'ex5_checker_mrf_gaussian_filtered.png');
%imwrite(RC_student/255,'ex5_checker_mrf_student_filtered.png');

% Image
TI = imread('la.png');
TI = double(TI);
NI = add_noisy_stripe(TI,30,20);
RI_gauss = denoising_grad_ascent(NI,sigma,eta);
RI_student = denoising_grad_ascent_student(NI,sigma,eta,alpha);
imshow(mat2gray(NI));
%waitforbuttonpress;
imshow(mat2gray(RI_gauss));
%waitforbuttonpress;
imshow(mat2gray(RI_student));
%imwrite(NI/255,'ex5_image_noise.png');
%imwrite(RI_gauss/255,'ex5_image_mrf_gaussian_filtered.png');
%imwrite(RI_student/255,'ex5_image_mrf_student_filtered.png');