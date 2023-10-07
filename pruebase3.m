T1 = SE3() %creas el objeto de la clase 
T2 = SE3()

T = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1] %esto es la matriz de transformación
T2 = [1 0 0 0; 0 1 0 0; 0 0 1 5; 0 0 0 1]

clf
figure(1)
hold on
view(35,35)
trplot(T, 'color', 'c') %con esta función graficas la matriz en color azul claro 

view(35,35)
hold on%para que se grafique en la misma figura
trplot(T2,'color', 'r') %aqui lo mismo pero en rojo
hold off

