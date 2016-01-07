function g = denoising_grad_llh( T, N, sigma )
%Gradient of the likelihood
%d/dT_ij log p(N|T) = d/dT_ij -1/ (2*sigma^2) * (N_ij - T_ij)^2
%                   = (Nij - T_ij)/ sigma^2

g = (N - T) / sigma^2;

end

