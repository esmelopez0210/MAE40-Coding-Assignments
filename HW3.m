%% P1d short cut
clc; clear all; close all;
syms Vi s L C R c1                  % Laplace variable s, parameters
syms Vo Vm IL IC IR Iload              % variables to be solved for 
eqn1= Vm + (L*s)*IL            == Vi;  % Component eqns
eqn2= (C*s)*Vo - (C*s)*Vm + IC == 0;
eqn3= -Vo + R*IR               == 0;
eqn4= -Vo + (R/c1)*Iload       == 0;
eqn5= IL - IC                  == 0;   % KCLs
eqn6= IC - IR - Iload          == 0;
A = solve(eqn1,eqn2,eqn3,eqn4,eqn5, ...
    eqn6,Vo, Vm, IL, IC, IR, Iload);   % do the solve
A.Vo/Vi                                % output of interest (V0), divided by input (V1)

%% P1d
clc, clear, close all; 

syms Vi s L C R c1;
% x = { Vo   Vm   IL   IC   IR   Iload }
A =   [  0    1  L*s    0    0     0;          % Vm + Ls*IL = Vi
        C*s -C*s  0     1    0     0;          % Cs*Vo - Cs*Vm + IC = 0
        -1    0   0     0    R     0;          % -Vo + R*IR = 0
        -1    0   0     0    0    R/c1;        % -Vo + (R/c1)*Iload = 0
         0    0   1    -1    0     0;          % IL - IC = 0
         0    0   0     1   -1    -1];         % IC - IR - Iload = 0
b = [Vi; 0; 0; 0; 0; 0];
x = A\b;
H_s = simplify(x(1))/Vi                        % transfer function output

omega = 10;
Q = 5;
F = RR_tf([(omega/Q) 0],[1 (omega/Q) omega^2]) % Bode
figure(1), RR_bode(F)
title 'Bode Plot'