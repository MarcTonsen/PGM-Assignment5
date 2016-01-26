% this script states and solves the floor dual for function g
n = 5; % number of variables
binCoeff = nchoosek(n,2);
N = 2*n + n*(n-1) + 2*binCoeff;
M = n + binCoeff; 
A = zeros(M,N);
b = [4, 5, -4, -2, 201, ... % degree 1 terms
    5, -2, 0, 3, 66, 3, -134, -1, -134, -2]'; % degree 2 terms
lowerBound = zeros(N,1);
obj = zeros(N,1);

% fill matrix A and objective function
for j=1:n % first constraint set
    obj(getIndex5Vars([],j)) = -1;
    
    A(j, getIndex5Vars(j,[])) = 1;
    A(j, getIndex5Vars([],j)) = -1;
    for k=1:(j-1)
        A(j, getIndex5Vars(j,k)) = 1;
        A(j, getIndex5Vars([],[k,j])) = -1;
    end
    for k=(j+1):n
        A(j, getIndex5Vars(j,k)) = 1;
        ind = getIndex5Vars([],[j,k]);
        A(j, getIndex5Vars([],[j,k])) = -1;
    end
end
jkSets = nchoosek([1,2,3,4,5],2);
for l=1:binCoeff % second constraint set
    j = jkSets(l,1);
    k = jkSets(l,2);
    
    obj(getIndex5Vars([],[j,k])) = -1;
    
    A(n+l,getIndex5Vars([],[j,k])) = 1;
    A(n+l,getIndex5Vars([j,k],[])) = 1;
    A(n+l,getIndex5Vars(j,k)) = -1;
    A(n+l,getIndex5Vars(k,j)) = -1;
end

% solve floor dual
[c,fval] = linprog(obj,[],[],A,b,lowerBound,[]);
floorDualVal = fval - 1; % fval + c_0
