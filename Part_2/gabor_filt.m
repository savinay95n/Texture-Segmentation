%%%%%%%%%%%%%%%%%%%%%%%%%%%% gabor_filt.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Apply the Gabor filter with the specified parameters
%
% Input Variables:
%      Inp_Img     Input image in grayscale format 
%      F           Parameter
%      Theta       Orientation of sinusoid
%      Sigma       Width
%      
% Returned Results:
%      h1_x, h2_y       GEF's in the direction of x & y
%      i1_xy, i2_xy     images obtained after convolving GEF's and i/p image
%      Out_Img          Gabor filtered image
%
% Processing Flow:
%      1.  Consider the input image as Inp_Img
%      2.  Compute the GEF's in the x-axis and y-axis directions with the
%          specified 'F', 'theta' and 'sigma' parameter values
%      3.  Perform convolution between the image and the GEF's with the
%          respective directions
%      4.  Output the image after applying modulus
%
% The following functions are called:
%      compute_gef.m        compute the GEF values
%      compute_convn.m      perform the convolution operation
%      abs.m                compute the modulus of the input image
%
%
% Author:      Sweekar Sudhakara, Nagarjuna Pampana, Savinay Nagendra and
%              Prapti Panigrahi
% Date:        4/16/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Out_Img = gabor_filt(Inp_Img, F, Theta, Sigma)

    [h1_x, h2_y] = compute_gef(F, Theta, Sigma);

    i1_xy = compute_convn(Inp_Img, 1, h1_x, Sigma);
    
    i2_xy = compute_convn(i1_xy, 0, h2_y, Sigma);
    
    Out_Img = abs(i2_xy);
    
end
