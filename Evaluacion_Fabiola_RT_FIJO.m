%Fabiola Muñoz Vera
%201931104
%Robotica I
clc;clear all;
i = 1;
Rot = [];
GRAD = [0 0 0];
R = [];
A = eye;
A0 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
A1 = eye;
A2 = eye;
A3 = eye;
A4 = eye;
n = 0;

S = 0;
disp('Escribe los ángulos alpha y beta  y el valor de L de la siguiente forma [alpha beta L]')
Val = input("Valores:  ")
while n == 0
    p = 1;
    S = S + 1;
    A = eye;
    
    switch S
        case 1
            Op = ['R' 'R' 'R' 'T']
        case 2
            Op = ['R' 'R' 'R' 'T']
        case 3
            Op = ['T']
    end
    
    
    mov = length(Op);
    
    while p < mov + 1
        switch Op(p)
            case 'T'
                Rt = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];  
                 switch S
                    case 1
                        V = [0;Val(3); 0]
                    case 2
                        V = [0;0; Val(3)]
                    case 3
                        V = [0;0; Val(3)]
                end
                
                Rt(1,4) = V(1);
                Rt(2,4) = V(2);
                Rt(3,4) = V(3);
                A = A*Rt;

            case 'R'
              
            %'Escribe el eje de rotación y los grados de la siguiente forma: [0 grados] usando comillas simples para las letras')
            %'Donde 0 = x, y=1, z=2')
            switch S
                    case 1
                        switch p
                            case 1
                                Rot = [1 90]
                            case 2
                                Rot = [2 90]
                            case 3
                                Rot = [1 -(90-Val(1))]
                        end
                         
                    case 2
                        switch p
                            case 1
                                Rot = [1 90]
                            case 2
                                Rot = [2 90]
                            case 3
                                Rot = [1 (90-Val(2))]
                        end
            end
      
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
S2=A1*A2;


R = A1*A2*A3
%ingresa matriz de transformacion y el color de los ejes
M = plots(A0, 'r') %punto de origen ROJO
M = plots(A1, 'c') %S1 en CIAN
M = plots(S2, 'm') %S2 en MAGENTA
M = plots(R, 'g') %S3 en VERDE


% clf
% figure(1)
% grid on
% view(35,35)
% hold on
% trplot(A0, 'color', 'r')
% 
% 
% 
% view(35,35)
% hold on
% trplot(A1, 'color', 'c')
% 
% 
% view(35,35)
% hold on
% trplot(A1*A2,'color', 'b')
% 
% 
% view(35,35)
% hold on
% trplot(A1*A2*A3, 'color', 'm')
% hold off
% 


pause;


function M = plots(M, col)
%La columna 4 de la matriz es la traslación y se suma y toma en cuenta como
%punto de origen para el sistema de ejes
%EJE X
X = [M(1,4) M(1,1) + M(1,4)] ;
Y = [M(2,4) M(2,1)+ M(2,4)] ;
Z = [M(3,4) M(3,1)+ M(3,4)] ;

%axis([0 10 0 10 0 10])
grid on
plot3(X',Y',Z', col)
text(X(2), Y(2), Z(2),' X')
hold on
%EJE y
X = [M(1,4) M(1,2)+M(1,4)] ;
Y = [M(2,4) M(2,2)+M(2,4)] ;
Z = [M(3,4) M(3,2)+M(3,4)] ;

%axis([0 10 0 10 0 10])
grid on
plot3(X',Y',Z',col)
text(X(2), Y(2), Z(2),' Y')
hold on
%EJE y
X = [M(1,4) M(1,3)+M(1,4)] ;
Y = [M(2,4) M(2,3)+M(2,4)] ;
Z = [M(3,4) M(3,3)+M(3,4)] ;

%axis([0 10 0 10 0 10])
grid on
plot3(X',Y',Z', col)
text(X(2), Y(2), Z(2),' Z')

end
