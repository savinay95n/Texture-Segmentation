%%%%%%%%%%%%%%%%%%%%%%%%%% compute_convn.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the convolution operation
%
% Input Variables:
%      Inp_Img     Input image in grayscale format 
%      axis        Structuring element
%      h           GEF
%      Sigma       Width
%      
% Returned Results:
%      Out_Img      Convolved image
%
% Processing Flow:
%      1.  Based on the axis and the window size (sigma), the sum of the
%          product between the image and the GEF gives the convolved image
%      2.  Perform the above step for the other axis based on the choice
%
%
% Author:      Sweekar Sudhakara, Nagarjuna Pampana, Savinay Nagendra and
%              Prapti Panigrahi
% Date:        4/16/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Out_Img = compute_convn(Inp_Img, axis, h, Sigma)

    [M, N] = size(Inp_Img);
    Out_Img = zeros(M, N);

    if axis      % 'x' - axis
        
        for i = ((2*Sigma)+1) : M-((2*Sigma)+1)
            for j = ((2*Sigma)+1) : N-((2*Sigma)+1)
                Out_Img(i,j) = sum((Inp_Img(i, j-(2*Sigma) : j+(2*Sigma)).*h));
            end
        end
        
    else         % 'y' - axis
        
        for i = ((2*Sigma)+1) : M-((2*Sigma)+1)
            for j = ((2*Sigma)+1) : N-((2*Sigma)+1)
                Out_Img(i,j) = sum((Inp_Img(i-(2*Sigma) : i+(2*Sigma),j).*h));
            end
        end
        
    end

end
