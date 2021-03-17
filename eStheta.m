function T = eStheta(S, theta)

Sw = S(1:3);
Sv = S(4:6);
zeros_vec = zeros(3,1);

if isequal(Sw, zeros_vec) && (round(norm(Sv)) == 1)
    T = [eye(3) Sv*theta;
         zeros(1,3) 1   ];
elseif round(norm(Sw)) == 1
    eSwTheta = eye(3) + sin(theta)*skew(Sw) + (1 - cos(theta))*skew(Sw)^2;
    T = [eSwTheta, (eye(3)*theta + (1 - cos(theta))*skew(Sw) + (theta - sin(theta))*skew(Sw)^2 )*Sv;
         zeros(1,3), 1];
else
    disp("There is a problem in the S variable")
    T = NaN;
end