function [R] = RotaZ(Theta)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
R=eye(3);
R=[cosd(Theta) -sind(Theta) 0;sind(Theta) cosd(Theta) 0;0 0 1];
end

