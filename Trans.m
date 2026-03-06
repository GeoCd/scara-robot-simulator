function [T] = Trans(Valor,Tipo)
%Funcion Trans(Valor,Tipo)
%Descripcion:	Obtiene la Matriz Homogenea de una transformación de rotación
%		o desplazamiento
%Parametros:
%	Entrada
%		Valor - Valor numerico de una rotación o desplazamiento
%		Tipo  - Identifica la transformación a realizar
%			Tx Desplazamiento en X
%			Ty Desplazamiento en Y
%			Tz Desplazamiento en Z
%			Rx Rotación en X en grados
%			Ry Rotación en Y en grados
%			Rz Rotación en Z en grados
%	Salida
%		T - Matriz homogenea de transformacion
T=eye(4);
if (Tipo=='Tx')
    T(1,4)=Valor;
elseif (Tipo=='Ty')
    T(2,4)=Valor;
elseif (Tipo=='Tz')
    T(3,4)=Valor;
elseif (Tipo=='Rx')
    T(1:3,1:3)=RotaX(Valor);
elseif (Tipo=='Ry')
    T(1:3,1:3)=RotaY(Valor);
elseif (Tipo=='Rz')
    T(1:3,1:3)=RotaZ(Valor);
end

end

