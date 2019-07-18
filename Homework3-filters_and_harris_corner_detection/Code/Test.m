
% image=double(imread('image.jpg'));
% image_tran=uint8(imtranslate(image,[10,15]));
% image_rotate=uint8(imrotate(image,90));
% image_scale=uint8(imresize(image,5));
% imwrite(image_tran,'translate.jpg');
% imwrite(image_rotate,'rotate.jpg');
% imwrite(image_scale,'scale.jpg');
[corners,desc]=harris('image.jpg',7,8000,true);
% [corners,desc]=harris('translate.jpg',7,8000,true);
% [corners,desc]=harris('rotate.jpg',7,8000,true);
% [corners,desc]=harris('scale.jpg',7,8000,true);



% REPORT
% Question B
% Translation may have fewer corners detected becasuse using imtranslate
% may hide some part of the image, and corners in the hidden part will not
% be detected. The difference between original and translate is not large
% The rotation has increased several points due to some error, the
% difference is not large.
% 
% I think the translate and rotate doesn't change the points detected,
% becasuse the surrounding of pixels and colors haven't changed. 
% 
% The scale has much more corners becasue I scale the image 5 times larger
% and there are more points can be detected as corners. However, when the
% corner become larger, some corner may not be detected due to scale.
% So, reasonable scale may get better results of corners



% Question C
% adding a positive or negative value doesn't change the number of corners
% detected a lot, since the R we get should be similar. The reason for some
% corners not being detected might be the color number exceed range [0,255]
% and it goes to 0 or 255
% 
% multiply a positive value larger than 1 gives us more corners detected and
% multiply a positive value less than 1 gives us much fewer corners
% detected. 
% I think multiply a positive value less than 1 can give us better result
% since this can give us points that are having more distinct R which means 
% clear corner has larger R and unclear corner has smaller R, so less corner 
% detected but these are clear corners