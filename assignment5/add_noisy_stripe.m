function N = add_noisy_stripe(T, sigma, width)
% add noisy stripe to image
s = RandStream('mt19937ar','Seed',1);
RandStream.setGlobalStream(s);

[m,n] = size(T);
start_stripe = round(n*rand());
width = min(n-start_stripe+1,width);
end_stripe = start_stripe + width-1;

noise = normrnd(0,sigma,m,width);
N = T;
N(:,start_stripe:end_stripe) = N(:,start_stripe:end_stripe) + noise;
N(N>255) = 255;
N(N<0) = 0;

end