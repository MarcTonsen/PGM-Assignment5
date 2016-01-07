stripes = toy_stripes(400, 200, 50);
stripes_noise = add_sp_noise(stripes, 0.1);
stripes_filtered = median_filter(stripes_noise, 5);
imshow(mat2gray(stripes_filtered));

checker = toy_checkerboard(400, 200, [50 50]);
checker_noise = add_sp_noise(checker, 0.1);
checker_filtered = median_filter(checker_noise, 5);
imshow(mat2gray(checker_filtered));

img = imread('la.png');
img = double(img);
img_noise = add_noise(img, 25);
imshow(mat2gray(img_noise));
img_filtered = median_filter(img_noise, 5);
waitforbuttonpress;
imshow(mat2gray(img_filtered));