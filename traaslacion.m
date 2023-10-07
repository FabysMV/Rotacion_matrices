%Fabiola Muñoz Vera
%201931104
%Robotica I
clc;clear all;
i=1;
V = [0; 0 ;0];
V_uvw = [0; 0; 0 ;1];
R = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];  
disp('Escribe las coordenadas de la traslacion de la siguiente forma: [x0; y0; z0]')
V = input("Traslación:  ")
disp('Escribe las coordenadas del vector con respecto a uvw: [d; d; d; 1]')
V_uvw = input("Vector:  ")
R(1,4) = V(1);
R(2,4) = V(2);
R(3,4) = V(3);
R
V_uvw = R*V_uvw

pause;
