clf
figure(1)
grid on
view(35,35)
% axis([0 10 0 10 0 10])
% X = [0 1] ; %el primer elemento es el punto de inicio y debe de coincidir los de x y z
% Y = [0 0] ;
% Z = [0 0] ;
% plot3(X',Y',Z')
% text(X(2), Y(2), Z(2),' X')
% hold on
% %-----------------------------------
% X = [0 0] ;
% Y = [0 1] ;
% Z = [0 0] ;
% axis([0 10 0 10 0 10])
% plot3(X',Y',Z')
% text(X(2), Y(2), Z(2),' Y')
% hold on
% %plot3(X',Y',Z','.')
% X = [0 0] ;
% Y = [0 0] ;
% Z = [0 1] ;
% axis([0 10 0 10 0 10])
% plot3(X',Y',Z')
% text(X(2), Y(2), Z(2),' Z')
N = [1 0 0 2; 0 1 0 0; 0 0 1 5; 0 0 0 1];
L =[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

M = plots(N, 'r') %ingresa matris de transformacion y el color de los ejes
M = plots(L, 'c')






function M = plots(M, col)
%La columna 4 de la matriz es la traslación y se suma y toma en cuenta como
%punto de origen para el sistema de ejes
%EJE X
X = [M(1,4) M(1,1) + M(1,4)] ;
Y = [M(2,4) M(1,2)+ M(2,4)] ;
Z = [M(3,4) M(1,3)+ M(3,4)] ;

axis([0 10 0 10 0 10])
plot3(X',Y',Z', col)
text(X(2), Y(2), Z(2),' X')
hold on
%EJE y
X = [M(1,4) M(2,1)+M(1,4)] ;
Y = [M(2,4) M(2,2)+M(2,4)] ;
Z = [M(3,4) M(2,3)+M(3,4)] ;

axis([0 10 0 10 0 10])
plot3(X',Y',Z',col)
text(X(2), Y(2), Z(2),' Y')
hold on
%EJE y
X = [M(1,4) M(3,1)+M(1,4)] ;
Y = [M(2,4) M(3,2)+M(2,4)] ;
Z = [M(3,4) M(3,3)+M(3,4)] ;

axis([0 10 0 10 0 10])
plot3(X',Y',Z', col)
text(X(2), Y(2), Z(2),' Z')

end