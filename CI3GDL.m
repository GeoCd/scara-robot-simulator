function [q] = CI3GDL(x,y,z)
Tini=[1 0 0 2; ... 
      0 1 0 0; ...
      0 0 1 4; ...
      0 0 0 1];
theta1=atan2(y,x);
T01=Trans(theta1,'Rz')*Tini;
Nx=(x-T01(1,4))
Ny=(y-T01(2,4))
Nz=z-4;
Nyx=sqrt(Nx^2+Ny^2)
[theta2,theta3] = CinInv2gdl(Nyx,Nz);
q=[theta1*180/pi;theta2-90;theta3+90]
end

