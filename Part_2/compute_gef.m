%%%%%%%%%%%%%%%%%%%%%%%%%%% compute_gef.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      compute the GEF  for the given parameters
%
% Input Variables:
%      F           Parameter
%      Theta       Orientation of sinusoid
%      Sigma       Width
%      
% Returned Results:
%      h1_x, h2_y       GEF's in the direction of x & y
%
% Processing Flow:
%      1.  Define 'x' & 'y' arrays based on the value of sigma
%      2.  Also define the gaussian function along 'x' & 'y' - axis 
%      3.  Compute the GEF's for both the axes
%
%
% Author:      Sweekar Sudhakara, Nagarjuna Pampana, Savinay Nagendra and
%              Prapti Panigrahi
% Date:        4/16/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [h1_x, h2_y] = compute_gef(F, Theta, Sigma)

    x_val = [-(2*Sigma): 1 : (2*Sigma)];
    y_val = x_val';
    
    g1_x = (exp(-(x_val.^2)/(2*(Sigma^2))))./(sqrt(2*pi)*Sigma); 
    g2_y = g1_x';
    
    h1_x = g1_x.*(exp(1i*2*pi*F*x_val*cosd(Theta)));
    h2_y = g2_y.*(exp(1i*2*pi*F*y_val*sind(Theta)));

end

