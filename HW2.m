%% Problem 1

clc, clear, close all; 

syms Vo Ra Cb Cc Rd s;
% x = {  V1;    V2;   Ia;   Ib;    Ic; Id }
A =   [   1      0    Ra     0      0   0 ;  % V1 + Ra*Ia = Vo
          0      1     0     0      0 -Rd ;  % V2 - Rd*Id = 0
          0      1     0  1/(Cb*s)  0   0 ;  % V2 + (1/Cb*s)*Ib = Vo
       (-Cc*s) (Cc*s)  0     0     -1   0 ;  % -Cc*s*V1 + Cc*s*V2 - Ic = 0
          0      0     1     0      1   0 ;  % Ia + Ic = 0
          0      0     0     1     -1  -1 ;];% Ib - Ic - Id = 0

b = [Vo; 0; Vo; 0; 0; 0];
x = A\b;
H_s = simplify(x(1)/Vo);                     % transfer function output
H_s

omega = 10;
F = RR_tf([1 omega omega^2],[1 (3*omega/2) omega^2]);
figure(1), RR_bode(F);
title 'Bode Plot'

%% Problem 2

clc, clear, close all; 

syms Vo Rb Rc Ca Cd s;
% x = {  V1;    V2;   Io;   Ia;    Ib;    Ic;   Id }
A =   [   1      0     0  1/(Ca*s)  0      0     0;  % V1 + (1/Ca*s)*Ia = Vo
          0      1     0     0     Rb      0     0;  % V2 + Rb*Ib = Vo
          1     -1     0     1      0     Rc     0;  % V1 - V2 + Rc*Ic = 0
          1    Cd*s    0     0      0      0    -1;  % Cd*s*V2 - Id = 0
          0      0     0     1      0      1     0;  % Ia + Ic = 0
          0      0     0     0      1     -1    -1;  % Ib - Ic - Id = 0
          0      0     1    -1     -1      0     0]; % Io - Ia - Ib = 0

b = [Vo; Vo; 0; 0; 0; 0; 0];
x = A\b;
H_s = simplify(x(1)/Vo);                             % transfer function output
H_s

%% Problem 2c
clc, clear, close all; 

syms Vo R C s;
% x = {  V1;    V2;   Io;   Ia;    Ib;    Ic;   Id }
A =   [   1      0     0  1/((C/2)*s)  0      0     0;  % V1 + (1/Ca*s)*Ia = Vo
          0      1     0     0     R      0     0;  % V2 + Rb*Ib = Vo
          1     -1     0     1      0     R     0;  % V1 - V2 + Rc*Ic = 0
          1    2*C*s    0     0      0      0    -1;  % Cd*s*V2 - Id = 0
          0      0     0     1      0      1     0;  % Ia + Ic = 0
          0      0     0     0      1     -1    -1;  % Ib - Ic - Id = 0
          0      0     1    -1     -1      0     0]; % Io - Ia - Ib = 0

b = [Vo; Vo; 0; 0; 0; 0; 0];
x = A\b;
H_s = simplify(x(1)/Vo);                             % transfer function output
H_s

omega = 10;
C = 3;
R = 2;
F = RR_tf([(2-2*C) (2*omega - C*omega^2) (2*omega^2)], ...
    [(2-(2*C*omega)) (6*omega-(C*omega^2)) (2*R*omega^2 + 2*omega^2)]);
figure(1), RR_bode(F);
title 'Bode Plot'
