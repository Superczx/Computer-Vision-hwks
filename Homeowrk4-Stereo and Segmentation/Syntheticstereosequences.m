% Zhixing Chang
% CSCI 4831
% Homework 4
% Ioana Fleming
% 
imageR=imread('frame_1R.png');
imageL=imread('frame_1L.png');
imageLGray = rgb2gray(imageL);
imageRGray = rgb2gray(imageR);
disparityMap=disparity(imageLGray, imageRGray);
%SSD
% disparityMap_SSD1 = disparity_SSD(imageLGray, imageRGray,1);
% disparityMap_SSD5 = disparity_SSD(imageLGray, imageRGray,5);
% disparityMap_SSD11 = disparity_SSD(imageLGray, imageRGray,11);
%NCC
% disparityMap_NCC3 = disparity_NCC(imageLGray, imageRGray,3);
% disparityMap_NCC5 = disparity_NCC(imageLGray, imageRGray,5);
% disparityMap_NCC7 = disparity_NCC(imageLGray, imageRGray,7);
%UC
disparityMap_UC = disparity_UC(imageLGray,imageRGray,5);
% figure;
% subplot(2,2,1);
% imshow(disparityMap, [0, 64]);
% title('Disparity Map');
% colormap jet
% colorbar
% UC
% imshow(disparityMap_UC, [0, 64]);
% title('Disparity Map Uniqueness Constraints');
% colormap jet
% colorbar
% SSD
% subplot(2,2,2);
% imshow(disparityMap_SSD1, [0, 64]);
% title('SSD Disparity Map with window size 1');
% colormap jet
% colorbar
% subplot(2,2,3);
% imshow(disparityMap_SSD5, [0, 64]);
% title('SSD Disparity Map with window size 5');
% colormap jet
% colorbar
% subplot(2,2,4);
% imshow(disparityMap_SSD11, [0, 64]);
% title('SSD Disparity Map with window size 11');
% colormap jet
% colorbar
% % NCC
% subplot(2,2,2);
% imshow(disparityMap_NCC3, [0, 64]);
% title('NCC Disparity Map with window size 3');
% colormap jet
% colorbar
% subplot(2,2,3);
% imshow(disparityMap_NCC5, [0, 64]);
% title('NCC Disparity Map with window size 5');
% colormap jet
% colorbar
% subplot(2,2,4);
% imshow(disparityMap_NCC7, [0, 64]);
% title('NCC Disparity Map with window size 7');
% colormap jet
% colorbar