image=rgb2gray(imread('peppers.png'));
image_noise = imnoise(image,'salt & pepper');

meanFilter_base = ones(3)/9;

meanFilter = filter2(meanFilter_base,image_noise);
medianFilter = medfilt2(image_noise,[3 3]); 
gaussFilter1 = imgaussfilt(image_noise,1/3);
gaussFilter2 = imgaussfilt(image_noise,1);
gaussFilter3 = imgaussfilt(image_noise,1.5);
subplot(2,3,1), imshow(uint8(meanFilter));
subplot(2,3,2), imshow(uint8(medianFilter));
subplot(2,3,3), imshow(uint8(gaussFilter1));
subplot(2,3,4), imshow(uint8(gaussFilter2));
subplot(2,3,5), imshow(uint8(gaussFilter3));
% medianFilter got the best and clearest image

image_gauss_noise=imnoise(image,'gaussian',0,1/256);
imshow(uint8(image_gauss_noise));
meanFilter_gauss = filter2(meanFilter_base,image_gauss_noise);
medianFilter_gauss = medfilt2(image_gauss_noise,[3 3]);
gaussFilter1_gauss = imgaussfilt(image_gauss_noise,1/3);
gaussFilter2_gauss = imgaussfilt(image_gauss_noise,1);
gaussFilter3_gauss = imgaussfilt(image_gauss_noise,1.5);
% subplot(2,3,1), imshow(uint8(meanFilter_gauss));
% subplot(2,3,2), imshow(uint8(medianFilter_gauss));
% subplot(2,3,3), imshow(uint8(gaussFilter1_gauss));
% subplot(2,3,4), imshow(uint8(gaussFilter2_gauss));
% subplot(2,3,5), imshow(uint8(gaussFilter3_gauss));
% The result are pretty close. I think gaussFilter1_gauss is clearest from
% what I can see