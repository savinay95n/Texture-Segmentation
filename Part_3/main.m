%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the texture segmentation on d9d77.gif
%
% Input Variables:
%      Text_Img           input texture1.gif image
%      
% Returned Results:
%      GaborFilt_Img      image after applying Gabor filter
%      Segment_Img        superimposed segmented image onto the original
%                         image input
%
% Processing Flow:
%      1.  Read the texture1 image and convert into grayscale
%      2.  Apply the Gabor filter with F=0.063, theta=60 & sigma=36 with 
%          the GEF of width ((4*sigma)+1) pixels
%      3.  Segment the image with the manually chosen threshold and
%          superimpose the segmented image onto the original image
%
%
% The following functions are called:
%      imread.m            read the image
%      gabor_filt.m        apply Gabor filtering with specified parameters
%                          on a given image
%      segment_image.m     segment the smoothed image with certain
%                          threshold and superimpose on the original image
%      imshow.m            displays the image
%      mesh.m              3D plot of the image
%
%
% Author:      Sweekar Sudhakara, Nagarjuna Pampana, Savinay Nagendra and
%              Prapti Panigrahi
% Date:        4/16/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;      % Clear out all memory 
close all;

Text_Img = double(imread('d9d77.gif'));
figure; imshow(uint8(Text_Img)); 
figure; mesh(Text_Img);

% Apply Gabor filter

GaborFilt_Img = gabor_filt(Text_Img, 0.063, 60, 36);
figure; imshow(GaborFilt_Img, []);
figure; mesh(GaborFilt_Img);

% Segment the smoothed image

Segment_Img = segment_image(GaborFilt_Img, Text_Img, 0.3);
figure; imshow(Segment_Img); 
