function [R] = RotaY(Theta)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
R=eye(3);
R=[cosd(Theta) 0 sind(Theta);0 1 0;-sind(Theta) 0 cosd(Theta)];

end

