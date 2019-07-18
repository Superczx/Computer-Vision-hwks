% Zhixing Chang
% CSCI 4831
% Homework 4
% Ioana Fleming
% 
function map=depth(disparitymap,stereoParams)
    [row_max,col_max]=size(disparitymap);
    B=sqrt(sum(stereoParams.TranslationOfCamera2.^2));
    f=stereoParams.CameraParameters1.FocalLength(1);
    cx=stereoParams.CameraParameters1.PrincipalPoint(1);
    cy=stereoParams.CameraParameters1.PrincipalPoint(2);
    
%     https://stackoverflow.com/questions/27374970/q-matrix-for-the-reprojectimageto3d-function-in-opencv
%     Q=[1 0 0 -cx;0 1 0 -cy;0 0 0 f;0 0 -1/B 0];
    for row=1:row_max
        for col=1:col_max
            depth(row,col,1)=col*4;
            depth(row,col,2)=row*4;
            depth(row,col,3)=B*f/disparitymap(row,col);
%             v=Q'*[row;col;double(disparitymap(row,col));1];
%             depth(row,col,:)=v(1:3)./v(4);
        end
    end
    map=depth;
end