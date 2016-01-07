function img = toy_checkerboard( n, m, cSize )
%n, m image size
%cSize box size

img = zeros(m,n);

for i = [0:ceil(n/cSize(1))-1]
    for j = [0:ceil(m/cSize(2))-1]
        if mod(i, 2) == 0
            if mod(j, 2) == 0
                continue;
            else
                img(j * cSize(2) + 1: min(m,(j+1) * cSize(2)), i * cSize(1) + 1: min(n,(i+1) * cSize(1))) = 255;
            end
        else
            if mod(j, 2) == 0
                img(j * cSize(2) + 1: min(m, (j+1) * cSize(2)), i * cSize(1) + 1: min(n,(i+1) * cSize(1))) = 255;
            else
                continue;
            end
        end
    end
end



end

