%%%%%%%%%%%%%%%%%%%%%%%%%%%% smooth_filt.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Smoothen the Gabor filtered image output
%
% Input Variables:
%      Inp_Img     Input image in grayscale format 
%      Sigma       Width
%      
% Returned Results:
%      Out_Img      Smoothed image
%
% Processing Flow:
%      1.  Define the 'x' - axis array based on the sigma value
%      2.  Compute the g(x,y) gaussian of the array for both the axes
%      3.  Output the smoothed image after convolving g(x,y) with the image
%
% The following functions are called:
%      compute_convn.m      perform the convolution operation
%
%
% Author:      Sweekar Sudhakara, Nagarjuna Pampana, Savinay Nagendra and
%              Prapti Panigrahi
% Date:        4/16/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Out_Img = smooth_filt(Inp_Img, Sigma)

    x_val = [-(2*Sigma): 1 : (2*Sigma)];
    
    g1_x = (exp(-(x_val.^2)/(2*(Sigma^2))))./(sqrt(2*pi)*Sigma); 
    g2_y = g1_x';
    
    i1_xy = compute_convn(Inp_Img, 1, g1_x, Sigma);
    
    Out_Img = compute_convn(i1_xy, 0, g2_y, Sigma);
    
end
