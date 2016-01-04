function N = add_noise( T, sigma )
%Add gaussian noise to image T
s = RandStream('mt19937ar','Seed',1);
RandStream.setGlobalStream(s);

[m,n] = size(T);
R = normrnd(0, sigma, m, n);
R = round(R);
N = T + R;
N(N>255) = 255;
N(N<0) = 0;
end

