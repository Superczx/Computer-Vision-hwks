%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zhixing Chang
% CSCI 4831 Computer Vision
% Homework 2
% Instructor: Flemmming
% Feb/13/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f=computeH(matrix,num_of_points)
    %the four times of random, without repeat row
    %no repeat since we want 4 different points
    random_rows=randperm(num_of_points,4);

%      %get Singular value decomposition for correspondences of both image 
% x is col y is row
% x2=H*x1
% the function is like previous line, but I want to make image 2 transform
% to image 1 so x1 is image 2 points and x2 is image 1 points
    x1=matrix(random_rows(1:4),4);
    y1=matrix(random_rows(1:4),3);
    x2=matrix(random_rows(1:4),2);
    y2=matrix(random_rows(1:4),1);

    %ini ax, ay
    ax=zeros(4,9);
%     ax=zeros(4,8);
    ay=ax;
    %set up matrix
    for i=1:4
        ax(i,:)=[-x1(i) -y1(i) -1 0 0 0 x2(i)*x1(i) x2(i)*y1(i) x2(i)];
        ay(i,:)=[0 0 0 -x1(i) -y1(i) -1 y2(i)*x1(i) y2(i)*y1(i) y2(i)];
    end
    A=[ax(1,:);ay(1,:);ax(2,:);ay(2,:);ax(3,:);ay(3,:);ax(4,:);ay(4,:)];
    %only need v so get v by using svd
    [~,~,v]=svd(A);
    %the v is already ordered by matlab so get the last column of v
    H=v(:,end);
    %reshape H to 3 by 3 matrix
    H=reshape(H,3,3);
    H=H/H(3,3);

    f=H;
end