% Zhixing Chang
% Computer Vision
% Homework3 Last Question
% Harris Corner Detector
function [corner_coords,descriptors]=harris(I,w,threshold,suppression)
    image=double(rgb2gray(imread(I)));
    %Question C
%     image=image+100;
%     image=image-100;
    image=image.*3;
%     image=image.*0.3;
    Gauss=fspecial('gaussian',[w,w],1);
    %denoise
    image_denoise=conv2(image,Gauss,'same');
    %x edge y edge
    xedge=[-1 0 1;-1 0 1;-1 0 1];
    yedge=[-1 -1 -1;0 0 0;1 1 1];
    %get gradient for x and y
    Ix=conv2(image_denoise,xedge,'same');
    Iy=conv2(image_denoise,yedge,'same');
    
    %M matrix
    Ix2=conv2(Ix.^2,Gauss,'same');
    Iy2=conv2(Iy.^2,Gauss,'same');
    Ixy=conv2(Ix.*Iy,Gauss,'same');
    
    %R=det-trace
    a=0.04;
    R=(Ix2.*Iy2-Ixy.*Ixy)-a*(Ix2+Iy2).^2;
    %suppression
    local_max=ordfilt2(R,w^2,ones(w));
    
    %if statement
    if suppression
        harris_corner=(R==local_max)&(R>threshold);
    else
        harris_corner=(R>threshold);
    end
    [rows,cols]=size(harris_corner);
    %delete edges of image for cancel error for descriptor
    harris_corner(1,:)=0;
    harris_corner(:,1)=0;
    harris_corner(rows,:)=0;
    harris_corner(:,cols)=0;
    %get true position for corners
    [row,col]=find(harris_corner);
        corner_coords(:,1)=row;
        corner_coords(:,2)=col;
        %get descriptor
    for i=1:size(row)
        descriptors(i,:)=[image(row(i)-1,col(i)-1) image(row(i)-1,col(i)) image(row(i)-1,col(i)+1) image(row(i),col(i)-1) image(row(i),col(i)) image(row(i),col(i)+1) image(row(i)+1,col(i)-1) image(row(i)+1,col(i)) image(row(i)+1,col(i)+1)];
    end
    figure, imshow(uint8(image)), hold on,
    plot(corner_coords(:,2),corner_coords(:,1),'ys')
end