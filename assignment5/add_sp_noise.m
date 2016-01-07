function N = add_sp_noise( T, p )
%Add salt and pepper noise to image T with intensity p
s = RandStream('mt19937ar','Seed',1);
RandStream.setGlobalStream(s);

psalt = 0.5; % Use 50/50 salt and pepper?
[m,n] = size(T);
u = rand(m,n);
n = rand(m,n);
n(n <= psalt) = 255;
n(n < 1) = 0;
T(u <= p) = n(u <= p);
N = T;

end

