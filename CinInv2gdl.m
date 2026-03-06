function [a1,a2] = CinInv2gdl(Px,Py)
% Funcion: [a1,a2]=CinInv2gdl(Px,Py)
% Descripción: Calcula la cinemática inversa de un robot de 2 grados de
%              libertad
% Parámetros:
%     Entrada: Px y Py posición del efector final
%     Salida:  a1 y a2 ángulos de cada una de las articualciones
L1=8.5;
L2=8;
L3=sqrt((Px*Px)+(Py*Py));
gama=atan2d(Py,Px);
alfa=acosd(((L1*L1)+(L3*L3)-(L2*L2))/(2*L1*L3));
beta=acosd(((L1*L1)+(L2*L2)-(L3*L3))/(2*L1*L2));
a1=alfa+gama;
a2=beta-180;
end

