%Fabiola Muñoz Vera
%201931104
%Robotica I
clc;clear all;
i=1;
EJES = ['x' 'y' 'z'];
GRAD = [0 0 0];
R = [];
disp('Escribe los ejes de rotación de la siguiente forma: [a a a] usando comillas simples')
EJES = input("Eje de rotacion:  ")
disp('Escribe los ejes de rotación de la siguiente forma: [d d d]')
GRAD = input("Grados de rotacion:  ")

while i<4
    
    switch EJES(i)
        
        case 'x'
            disp('x')
            r = [1 0 0; 0 cosd(GRAD(i)) -sind(GRAD(i)); 0 sind(GRAD(i)) cosd(GRAD(i))];
        case 'y'
            disp('y')
            r = [cosd(GRAD(i)) 0 sind(GRAD(i)); 0 1 0; -sind(GRAD(i)) 0 cosd(GRAD(i))];
        case 'z'  
            disp('z')
            r = [cosd(GRAD(i)) -sind(GRAD(i)) 0; sind(GRAD(i)) cosd(GRAD(i)) 0; 0 0 1];
    end
    
    switch i
        case 1
            R1 = r;
        case 2
            R2 = r;
        case 3
            R3 = r;
    end
    i=i+1;
end

R = R3*R2*R1
disp('Escribe el punto inicial de la siguiente forma: [u; v; w]')
P_uvw = input("El punto inicial es:  ")
quiver3(0,0,0,P_uvw(1,1),P_uvw(2,1),P_uvw(3,1))
hold on
P_xyz = R*P_uvw
quiver3(P_xyz(1,1), P_xyz(2,1), P_xyz(3,1))
hold on
plot3(P_uvw(1,1), P_uvw(2,1), P_uvw(3,1), 'pentagram' )
hold on
plot3(P_xyz(1,1), P_xyz(2,1), P_xyz(3,1), 'pentagram' )
hold off

pause;
