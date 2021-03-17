function Ad = Adjoint(T)

R = T(1:3, 1:3);
p = T(1:3, 4);
skew_p = skew(p);
Ad = [R zeros(3,3); skew_p*R R];