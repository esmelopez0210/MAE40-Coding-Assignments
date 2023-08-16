% Problem 1
clear, close all; 

syms Vi L C Rload s;

% x = { I_L; I_C; I_Rload; Vo }
A = [-1  1   1          0;       % -IL + IC + IRload = 0
     L*s 0   0          1;       % L*s*IL + Vo = Vi
     0   0   0    (Rload*C*s+1); % (R*C*s+1)*Vo = Vi
     0   0 Rload       -1];      % IRload*Rload - Vo = 0
b = [0; Vi; Vi; 0];
x = A\b;
Vo_LPF2_Rload = simplify(x(4));

% Problem 2
omega4 = 10;
zeta = 0.1;
F_LPF2_Rload = RR_tf([omega4^2],[1 (2*zeta*omega4) omega4^2])
figure(1), RR_bode(F_LPF2_Rload)                            
hold on 

zeta = 0.7;
F_LPF2_Rload = RR_tf([omega4^2],[1 (2*zeta*omega4) omega4^2])
figure(2), RR_bode(F_LPF2_Rload)
hold on

zeta = 1;
F_LPF2_Rload = RR_tf([omega4^2],[1 (2*zeta*omega4) omega4^2])
figure(3), RR_bode(F_LPF2_Rload)

% Problem 3




