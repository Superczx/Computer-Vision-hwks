% Zhixing Chang
% CSCI 4831
% Homework 4
% Ioana Fleming
% 
function map=disparity_NCC(image_left,image_right,window_size)
image_left = double(image_left);
image_right = double(image_right);
[row_max,col_max]=size(image_left);
d=zeros(row_max,col_max);
NCC=zeros(1,64);
    for row=floor(window_size/2)+1:row_max-floor(window_size/2)
        for col=floor(window_size/2)+1:col_max-64-floor(window_size/2)
            for i=1:64
                row_pre=row-floor(window_size/2);
                row_next=row+floor(window_size/2);
                col_pre=col-floor(window_size/2);
                col_next=col+floor(window_size/2);
                image_left1=image_left(row_pre:row_next,col_pre+i:col_next+i);
                image_right1=image_right(row_pre:row_next,col_pre:col_next);
%                 image_left_mean=mean(image_left(row_pre:row_next,col_pre+i:col_next+i),'all');
%                 image_right_mean=mean(image_right(row_pre:row_next,col_pre:col_next),'all');
                NCC(i)=sum((image_left1).*(image_right1),'all')/sqrt(sum(abs(image_left1).^2,'all')*sum(abs(image_right1).^2,'all'));
%                 NCC(i)=sum((image_left1-image_left_mean).*(image_right1-image_right_mean),'all')/(sum(abs(image_left1-image_left_mean).^2,'all')*sum(abs(image_right1-image_right_mean).^2,'all'));
            end
            [~,NCC_index]=max(NCC);
            d(row,col)=NCC_index;
        end
%         row
    end
    map=d;
end