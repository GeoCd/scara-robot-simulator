function DrawRef(T)
% Funcion DrawRef(T)
% Descripción: Dibuja los sistemas de referencia de la matriz Homogena T
% Parámetros:
%      Entrada: Matriz Homogena T
px=T(1,4);
py=T(2,4);
pz=T(3,4);
x0x=[px T(1,1)+px];
x0y=[py T(2,1)+py];
x0z=[pz T(3,1)+pz];
line(x0x,x0y,x0z,'Color','red','linewidth',2);
%text(x0x(1,2),x0y(1,2),x0z(1,2),'x');
y0x=[px T(1,2)+px];
y0y=[py T(2,2)+py];
y0z=[pz T(3,2)+pz];
line(y0x,y0y,y0z,'Color','blue','linewidth',2);
%text(y0x(1,2),y0y(1,2),y0z(1,2),'y');

z0x=[px T(1,3)+px];
z0y=[py T(2,3)+py];
z0z=[pz T(3,3)+pz];
line(z0x,z0y,z0z,'Color','green','linewidth',2);
%text(z0x(1,2),z0y(1,2),z0z(1,2),'z');

end

