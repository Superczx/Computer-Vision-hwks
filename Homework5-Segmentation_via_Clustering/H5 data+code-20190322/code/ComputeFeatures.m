% Zhixing Chang
% CSCI 4831
% Homework 5
% Ioana Fleming
% 
function features = ComputeFeatures(img)
% Compute a feature vector for all pixels of an image. You can use this
% function as a starting point to implement your own custom feature
% vectors.
%
% INPUT
% img - Array of image data of size h x w x 3.
%
% OUTPUT
% features - Array of computed features for all pixels of size h x w x f
%            such that features(i, j, :) is the feature vector (of
%            dimension f) for the pixel img(i, j, :).

    img = double(img);
    height = size(img, 1);
    width = size(img, 2);
    features = zeros([height, width, 1]);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                                                                         %
    %                              YOUR CODE HERE                             %
    %                                                                         %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    features(:,:,1) = medfilt2(img(:,:,1),[3 3]); 
    features(:,:,2) = medfilt2(img(:,:,2),[3 3]); 
    features(:,:,3) = medfilt2(img(:,:,3),[3 3]); 
    
end