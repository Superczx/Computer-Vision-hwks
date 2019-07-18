% Zhixing Chang
% CSCI 4831
% Homework 4
% Ioana Fleming
% 
function map=disparity_SSD(image_left,image_right,window_size)
image_left = double(image_left);
image_right = double(image_right);
% Gauss=fspecial('gaussian',[window_size,window_size],1);
% image_left1=uint8(conv2(image_left,Gauss,'same'));
% image_right1=uint8(conv2(image_right,Gauss,'same'));
[row_max,col_max]=size(image_left);
d=zeros(row_max,col_max);
Gauss=fspecial('gaussian',[window_size window_size],1);
% image_right2=imtranslate(image_right,[64,0]);
    for row=floor(window_size/2)+1:row_max-floor(window_size/2)
        for col=floor(window_size/2)+1:col_max-64-floor(window_size/2)
            for i=0:64
                image_left1=image_left(row-floor(window_size/2):row+floor(window_size/2),col-floor(window_size/2)+i:col+floor(window_size/2)+i).*Gauss;
                image_right1=image_right(row-floor(window_size/2):row+floor(window_size/2),col-floor(window_size/2):col+floor(window_size/2)).*Gauss;
                 disparity(i+1)=sum(sum((image_right1-image_left1).^2));
            end
            [~,disparity_index]=min(disparity);
            d(row,col)=disparity_index;
        end
    end
    

    map=d;
    
end