% this script states and solves the floor dual for function g
n = 4; % number of variables
N = 2*n + n*(n-1) + 2*nchoosek(n,2);
M = n + nchoosek(n,2); 
A = zeros(M,N);
b = [8 -4 -1 (3*39) 40 1 -(2*39) 2 -(2*39) 1]';
lowerBound = zeros(N,1);

% fill matrix A and vector b
for j=1:n
    A(j,(11+(j-1)*4)) = 1;
    A(j,j) = -1;
    
    A(j,(12+(j-1)*4):(14+(j-1)*4)) = 1;
end
A(1,(5:7)) = -1;
A(2,5) = -1;
A(2,(8:9)) = -1;
A(3,6) = -1;
A(3,8) = -1;
A(3,10) = -1;
A(4,7) = -1;
A(4,(9:10)) = -1;
% second constraint {1,2}
A(5,5) = 1;
A(5,27) = 1;
A(5,12) = -1;
A(5,5) = -1;
% second constraint {1,3}

% solve floor dual
[c,fval] = linprog(obj,[],[],A,b,lowerBound,[]);
