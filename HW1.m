% Problem 1
clc, clear, close all; 

syms Vi L C Rload s;
% x = { I_L; I_C; I_Rload; Vo }
A = [ 1  -1   -1      0;        % IL - IC - IRload = 0
     L*s  0    0      1;        % L*s*IL + Vo = Vi
      0   1    0    C*s;        % IC - C*s*Vo = 0
      0   0  Rload  -1];        % Rload*IRload - Vo = 0
b = [0; Vi; 0; 0];
x = A\b;
Vo_LPF2_p2 = simplify(x(4));

% Problem 2
omega4 = 10;
zeta = 0.1;
F_LPF2_Rload = RR_tf([omega4^2],[1 (2*zeta*omega4) omega4^2])
figure(1), RR_bode(F_LPF2_Rload)
title 'Modified LPF2 Bode Plot, zeta = 0.1'
hold on 

zeta = 0.7;
F_LPF2_Rload = RR_tf([omega4^2],[1 (2*zeta*omega4) omega4^2])
figure(2), RR_bode(F_LPF2_Rload)
title 'Modified LPF2 Bode Plot, zeta = 0.7'
hold on

zeta = 1;
F_LPF2_Rload = RR_tf([omega4^2],[1 (2*zeta*omega4) omega4^2])
figure(3), RR_bode(F_LPF2_Rload)
title 'Modified LPF2 Bode Plot, zeta = 1'

%% Problem 3
clc, clear, close all; 
syms Vi L C Rload s Cd;
% x = { I_L; I_C; I_Rload; VCd; Vo }

A = [ 0   1    0     0   -C*s;      % IC - C*s*Vo = 0
      1  -1   -1     0      0;      % IL - IC - IRload = 0
     L*s  0    0     0      1;      % L*s*IL + V0 = Vi
      0   0    1   -Cd*s    0;      % IRload - Cd*s*VCd = 0
      0   0  Rload   1     -1];     % Rload*IRload + VCd - Vo = 0
b = [0; 0; Vi; 0; 0];
x = A\b;
Vo_LPF2_p3 = simplify(x(5));
Vo_LPF2_p3

%% Problem 4
clc, clear, close all; 
syms Vi L C s;
% x = { I_L; I_C; I_Rload; VCd; Vo }

A = [ 0   1    0        0   -C*s;      % IC - C*s*Vo = 0
      1  -1   -1        0      0;      % IL - IC - IRload = 0
     L*s  0    0        0      1;      % L*s*IL + V0 = Vi
      0   0    1     -4*C*s    0;      % IRload - Cd*s*VCd = 0
      0   0  sqrt(L*C)   1     -1];    % Rload*IRload + VCd - Vo = 0
b = [0; 0; Vi; 0; 0];
x = A\b;
Vo_LPF2_p4 = simplify(x(5));
Vo_LPF2_p4



