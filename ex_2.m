stripes = toy_stripes(100, 50, 25);
imwrite(stripes, 'ex2_stripes_ground_truth.png');
stripes_noise = add_sp_noise(stripes, 0.1);
imwrite(stripes_noise,'ex2_stripes_noisy.png');
stripes_filtered = median_filter(stripes_noise, 5);
imwrite(stripes_filtered,'ex2_stripes_median_filter.png');

checker = toy_checkerboard(100, 50, [25 30]);
imwrite(checker,'ex2_checker_ground_truth.png');
checker_noise = add_sp_noise(checker, 0.1);
imwrite(checker_noise,'ex2_checker_noisy.png');
checker_filtered = median_filter(checker_noise, 5);
imwrite(checker_filtered,'ex2_checker_median_filter.png');

img = imread('la.png');
img = double(img);
img_noise = add_noise(img, 25);
imwrite(uint8(img_noise),'ex2_image_noisy.png');
img_filtered = median_filter(img_noise, 5);
imwrite(uint8(img_filtered),'ex2_image_median_filter.png');