%%%%%%%%%%%%%%%%%%%%%%%%%% segment_image.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Segment the filtered image with certain threshold
%
% Input Variables:
%      Filt_Img     Gabor filtered image  
%      Text_Img     Original input image
%      Thresh       threshold
%      
% Returned Results:
%      Out_Img      Segmented image
%
% Processing Flow:
%      1.  Normalize the smoothed and filtered image
%      2.  Loop across the individual pixels of the normalized image and if
%          the pixel value is greater than threshold then replace it with
%          pixel value '1'
%      3.  Output the superimposed segmented image with original image and
%          display the delineating axis limits
%
%
% Author:      Sweekar Sudhakara, Nagarjuna Pampana, Savinay Nagendra and
%              Prapti Panigrahi
% Date:        4/16/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Out_Img = segment_image(Filt_Img, Text_Img, Thresh)

    Norm_Img = (Filt_Img - min(Filt_Img(:)))./(max(Filt_Img(:)) - min(Filt_Img(:)));
    figure; mesh(Norm_Img);
    
    Segment_Img = zeros(size(Norm_Img));
    Segment_Img(Norm_Img > Thresh) = 1;
    
    Out_Img = Segment_Img.*Text_Img;
    
    [y_val, x_val] = find(Segment_Img == 1);
    disp("Delineating 'x' value = " + min(x_val) + ", " + max(x_val));
    disp("Delineating 'y' value = " + min(y_val) + ", " + max(y_val));
    
end