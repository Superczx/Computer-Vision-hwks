%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zhixing Chang
% CSCI 4831 Computer Vision
% Homework 2
% Instructor: Flemmming
% Feb/13/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%transfer image2 to image1
function f=warp1(image1,image2,homography)
%get size of each image for future use
[row_max,col_max,~]=size(image2);
[image1_row_max,image1_col_max,~]=size(image1);
%get the after warping image size by calculating four corner of image2
image_range=homography*[1 1 col_max col_max;1 row_max 1 row_max;1 1 1 1];
image_range(:,1:4)=image_range(:,1:4)./image_range(3,1:4);
% get the size of the image after warping 
% image after warping will be called as new image
% combined image will be called as final image
[col1,row1]=meshgrid(floor(min(image_range(1,:))):floor(max(image_range(1,:)))+1,floor(min(image_range(2,:))):floor(max(image_range(2,:)))+1);
[r,c]=size(row1);
% initialized for new image position, not for final image
row2=1;
new_image=NaN(r,c,3);
%loop the new image to get points
    for row=floor(min(image_range(2,:))):floor(max(image_range(2,:)))+1
    % initialized for new image position, not for final image    
        col2=1;
        for col=floor(min(image_range(1,:))):floor(max(image_range(1,:)))+1
%      get the point using the for loop
% since the H is using [x;y;1]
%so here we need [col;row;1] to calculate
            point=[col;row;1];
%             use homography to get the original image (image2)point position
            newpoint=homography\point;  
            newpoint=newpoint/(newpoint(3));
            %make sure when the point get back to original image(image2) it
            %is inside the image2
            if newpoint(1)>1&&newpoint(1)<col_max&&newpoint(2)>1&&newpoint(2)<row_max
            %apply bilinear interpolation
                up=floor(newpoint(2));
                left=floor(newpoint(1));
                down=up+1;
                right=left+1;
                %for loop rgb to get all calculated rgb using bilinear
                %interpolation
                for rgb=1:3
                    %ini Qs
                    Q11=image2(up,left,rgb);
                    Q21=image2(up,right,rgb);
                    Q12=image2(down,left,rgb);
                    Q22=image2(down,right,rgb);
                    %bilinear interpolation
                    Q=(right-newpoint(1))*(down-newpoint(2))*Q11+(newpoint(1)-left)*(down-newpoint(2))*Q21+(right-newpoint(1))*(newpoint(2)-up)*Q12+(newpoint(1)-left)*(newpoint(2)-up)*Q22;
                    %new image
                    new_image(row2,col2,rgb)=Q;
                    
                end
            end
            col2=col2+1;
        end
        row2=row2+1;
    end
    %get the large picture size (combination of two image) or final image
    %size
    final_row_min=min([min(image_range(2,:));1;image1_row_max]);
    final_row_max=max([max(image_range(2,:));1;image1_row_max]);
    final_col_min=min([min(image_range(1,:));1;image1_col_max]);
    final_col_max=max([max(image_range(1,:));1;image1_col_max]);
    %ini final image
    final_image=zeros(floor(final_row_max-final_row_min),floor(final_col_max-final_col_min),3);
    %put image1 into the final image to the certain position
    %since new image may have some negative points after calculating with
    %homography, the image 1 may need to translate to certain position
    final_image(abs(floor(final_row_min))+1:abs(floor(final_row_min))+image1_row_max,abs(floor(final_col_min))+1:abs(floor(final_col_min))+image1_col_max,:)=image1(:,:,:);
    %ini position for new image
    row2=floor(min(image_range(2,:))-final_row_min)+1;
    col2=floor(min(image_range(1,:))-final_col_min)+1;
    %using loop to put new image into the final image
    %new image will cover image1
    for i=1:r
        col2=floor(min(image_range(1,:))-final_col_min)+1;
        for j=1:c
            %since new image covers image1, we do not want pixels outside
            %of the image covers image1, so isnan
            if ~isnan(new_image(i,j,:))
                final_image(row2,col2,:)=new_image(i,j,:);
            end
            col2=col2+1;
        end
        row2=row2+1;
    end
    %uncommented this line and comment the next line to only get the new
    %image
%     f=new_image;
    f=final_image;
end