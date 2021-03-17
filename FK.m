function T = FK(M, S, q)

T = eye(4);
for i = 1:length(q)
    T = T*eStheta(S(:,i), q(i));
end
T = T*M;