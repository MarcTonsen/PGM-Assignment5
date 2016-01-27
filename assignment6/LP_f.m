% this script states and solves the floor dual for function f. The Ordering
% of the indicies in the Matrix is given by the functions getIndex and
% getSets. The coefficiants are in the variable c except for
% c_emptySet_emptySet which is given in floorDualVal!
n = 4; % number of variables
binCoeff = nchoosek(n,2);
N = 2*n + n*(n-1) + 2*binCoeff;
M = n + binCoeff; 
A = zeros(M,N);
b = [1, -1, 7, 159, ... % degree 1 terms
    59, -6, -106, -3, -106, 1]'; % degree 2 terms
lowerBound = zeros(N,1);
obj = zeros(N,1);

% fill matrix A and objective function
for j=1:n % first constraint set
    obj(getIndex([],j)) = 1;
    
    A(j, getIndex([j],[])) = 1;
    A(j, getIndex([],[j])) = -1;
    for k=1:(j-1)
        A(j, getIndex([j],[k])) = 1;
        A(j, getIndex([],[k,j])) = -1;
    end
    for k=(j+1):n
        A(j, getIndex([j],[k])) = 1;
        ind = getIndex([],[j,k]);
        A(j, getIndex([],[j,k])) = -1;
    end
end
jkSets = nchoosek((1:n),2);
for l=1:binCoeff % second constraint set
    j = jkSets(l,1);
    k = jkSets(l,2);
    
    obj(getIndex([],[j,k])) = 1;
    
    A(n+l,getIndex([],[j,k])) = 1;
    A(n+l,getIndex([j,k],[])) = 1;
    A(n+l,getIndex(j,k)) = -1;
    A(n+l,getIndex(k,j)) = -1;
end

% solve floor dual
[c,fval] = linprog(obj,[],[],A,b,lowerBound,[]);
floorDualVal = -fval - 1; % = fval (of maximization) + c_0

