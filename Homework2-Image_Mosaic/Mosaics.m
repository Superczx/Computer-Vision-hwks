%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zhixing Chang
% CSCI 4831 Computer Vision
% Homework 2
% Instructor: Flemmming
% Feb/13/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AskForPoints=input('Do you want to get new points? Y/N: ','s');
% State number of points 
% change easily when we want different number of points
num_of_points=4;
% initialize points matrix 10X4
points=zeros(num_of_points,4);
%read image
image1=imread('border.jpg');
image1double=double(image1);
image2=imread('girlfriend.jpg');
image2double=double(image2);
%if the first input is Y or y, get points from image again
%put all x, and y we get into "points" matrix
%each row of points matrix is ordered by 
% image1_row, image1_col,image2_row, image2_col
if AskForPoints=='Y'||AskForPoints=='y'
    image(image1);
    [points(:,2),points(:,1)]=getPoint(num_of_points);
    image(image2);
    [points(:,4),points(:,3)]=getPoint(num_of_points);
%     write points into file
    dlmwrite('points_Matrix.txt',points);
else
%     if we do not want new points, read points from file
    points=dlmread('points_Matrix.txt');
end
% ini euclidean distance and H
euclidean_distance=zeros(20,1);
H=zeros(3,3,20);
%20 times repeat getting the best H
for i=1:20
    %compute H
    H(:,:,i)=computeH(points,num_of_points);
    %ini p and p2 for calculate Euclidean distance
    %ini distance for storing distances
    p=zeros(3,num_of_points);
    p2=p;
    distance=zeros(10,1);
    %calculating distance using all 10 points
    for j=1:num_of_points
        p(:,j)=[points(j,4);points(j,3);1];
        pprime=H(:,:,i)'*p(:,j);
        p2(:,j)=pprime/pprime(3);
        distance(j)=norm( [points(j,2);points(j,1)]-p2(1:2,j));
    end
        euclidean_distance(i)=sum(distance)/10;
end
%get index of min euclidean distance
[min_value,min_index]=min(euclidean_distance);
%get the H using the min index
min_H=H(:,:,min_index)';
%get new image after warping (combination of image1 and image2 after warping)
%transfer image2 to image1
newimage=warp1(image1double,image2double,min_H);
%show all images in one plot
subplot(2,2,1), imshow(image1);
subplot(2,2,2), imshow(image2);
subplot(2,2,3), imshow(uint8(newimage));
%save images to file
imwrite(uint8(newimage),'task3_Mosaics.jpg');