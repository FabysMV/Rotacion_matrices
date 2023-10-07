%Fabiola Muñoz Vera
%201931104
%Robotica I
clc;clear all;
i = 1;
Rot = [];
GRAD = [0 0 0];
R = [];
A = eye;
A0 = SE3();
A0 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
A1 = SE3();
A2 = SE3();
A3 = SE3();
A1 = eye;
A2 = eye;
A3 = eye;
A4 = eye;
n = 0;

S = 0;
while n == 0
    p = 1;
    S = S + 1;
    A = eye;
    disp('Escribe las operaciones que se llevarán a cabo: T para traslacion y R para rotacion')
    disp('en forma de vector, por ejemplo: [R T T R] cada uno entre comillas simples')
    Op = input("operaciones para A: ")
    mov = length(Op);
    
    while p < mov + 1
        switch Op(p)
            case 'T'
                Rt = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];  
                disp('Escribe las coordenadas de la traslacion de la siguiente forma: [x0; y0; z0]')
                V = input("Traslación:  ")
                
                Rt(1,4) = V(1);
                Rt(2,4) = V(2);
                Rt(3,4) = V(3);
                A = A*Rt;

            case 'R'
              disp('Escribe el eje de rotación y los grados de la siguiente forma: [0 grados] usando comillas simples para las letras')
            disp('Donde 0 = x, y=1, z=2')
            Rot = input("Rotacion:  ")
           switch Rot(1)
             case 0
                disp('x')
                r = [1 0 0 0; 0 cosd(Rot(2)) -sind(Rot(2)) 0; 0 sind(Rot(2)) cosd(Rot(2)) 0; 0 0 0 1];
            case 1
                disp('y')
                r = [cosd(Rot(2)) 0 sind(Rot(2)) 0; 0 1 0 0; -sind(Rot(2)) 0 cosd(Rot(2)) 0; 0 0 0 1];
            case 2 
                disp('z')
                r = [cosd(Rot(2)) -sind(Rot(2)) 0 0; sind(Rot(2)) cosd(Rot(2)) 0 0; 0 0 1 0; 0 0 0 1];
            end
     
       %r = resultado de rotación
               A = A*r;
        
        end
       p = p + 1; 
    end
  
         
    switch S
        case 1
            A1 = A;
        case 2
            A2 = A;
        case 3
            A3 = A;
    end

   
    if S > 2 %límite de matrices que se ingresan 
        n = 1;
    end
  
end

A1
A2
A3

R = A1*A2*A3
clf
figure(1)
grid on
view(35,35)
hold on
trplot(A0, 'color', 'r')



view(35,35)
hold on
trplot(A1, 'color', 'c')


view(35,35)
hold on
trplot(A1*A2,'color', 'b')


view(35,35)
hold on
trplot(A1*A2*A3, 'color', 'm')
hold off



pause;



