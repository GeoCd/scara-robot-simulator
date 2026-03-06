function DrawRobots(varargin)
% Funcion: DrawRobots(T01, T12, T23, ...)
% Descripcion: Dibuja un Robot de n articulaciones
%              a partir de la transformaciones homogeneas
% Parametros:
%	Entrada: Matrices homogeneas que relacionan el sistema de referencia i
%                con respecto al sistema de referencia i-1
T=eye(4);
x=zeros(1,nargin+1);
y=zeros(1,nargin+1);
z=zeros(1,nargin+1);
for(i=1:nargin)   
    T=T*varargin{i};
    x(i+1)=T(1,4);
    y(i+1)=T(2,4);
    z(i+1)=T(3,4);

end
line(x,y,z,'linewidth',3,'Color','black');
T=eye(4);
DrawRef(T);
for(i=1:nargin)   
    T=T*varargin{i};
    x(i+1)=T(1,4);
    y(i+1)=T(2,4);
    z(i+1)=T(3,4);
    DrawRef(T);
end


end

