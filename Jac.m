function J = Jac(S, q)

J=[];

for i = 1:length(q)
    T = eye(4);
    for j = 1:(i-1)
        T = T*eStheta(S(:,j), q(j));
        eStheta(S(:,j), q(j));
    end
    J(:, end+1) = Adjoint(T)*S(:,i);
end