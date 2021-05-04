%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the texture segmentation on texture2.gif
%
% Input Variables:
%      Text_Img           input texture2.gif image
%      
% Returned Results:
%      GaborFilt_Img      image after applying Gabor filter
%      Smooth_Img         smoothing applied on Gabor filtered image output
%      Segment_Img        superimposed segmented image onto the original
%                         image input
%
% Processing Flow:
%      1.  Read the texture2 image and convert into grayscale
%      2.  Apply the Gabor filter with F=0.059, theta=135 & sigma=8 with 
%          the GEF of width ((4*sigma)+1) pixels
%      3.  Apply the Smoothing filter on the Gabor filtered image output 
%          with sigma=24
%      4.  Segment the image with the manually chosen threshold and
%          superimpose the segmented image onto the original image
%
%
% The following functions are called:
%      imread.m            read the image
%      gabor_filt.m        apply Gabor filtering with specified parameters
%                          on a given image
%      smooth_filt.m       smoothen the Gabor filtered image output
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

Text_Img = double(255.*imread('texture2.gif'));
figure; imshow(Text_Img); 
figure; mesh(Text_Img);

% Apply Gabor filter

GaborFilt_Img = gabor_filt(Text_Img, 0.059, 135, 8);
figure; imshow(GaborFilt_Img, []);
figure; mesh(GaborFilt_Img);

% Smoothen the filtered image

Smooth_Img = smooth_filt(GaborFilt_Img, 24);
figure; imshow(Smooth_Img, []);
figure; mesh(Smooth_Img);

% Segment the smoothed image

Segment_Img = segment_image(Smooth_Img, Text_Img, 0.6);
figure; imshow(Segment_Img); 
