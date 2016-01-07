function img = toy_stripes( n, m, sSize )
%n , m size of image
%sSize stripe width

img = zeros(m,n);

for i = [0:ceil(n/sSize)-1]
    if mod(i, 2) == 0
        continue;
    else
        img(:, i * sSize + 1: min(n,(i+1) * sSize)) = 255;
    end
end

