% Zhixing Chang
% CSCI 4831
% Homework 4
% Ioana Fleming
% 
function map=stereoDP(e1,e2,maxDisp,occ)
    [~,col_max]=size(e1);
    d=zeros(col_max);
    for i=1:col_max
        for j=1:col_max
            d(i,j)=(e1(i)-e2(j))^2;
        end
    end
    D=zeros(col_max+1);
    D(1,:)=1:col_max+1;
    D(:,1)=1:col_max+1;
    dir=zeros(col_max+1);
    D=D*occ;
%     D(1+1,1+1)=d(1,1);
    for i=2:col_max+1
        for j=2:col_max+1
            compare=[D(i-1,j-1)+d(i-1,j-1) D(i-1,j)+occ D(i,j-1)+occ];
% 1 means northwest, 2 means north, 3 means west
% west means e2 goes to right 1 position
% north means e1 goes to right 1 position
% northwest means match
            [D(i,j),dir(i,j)]=min(compare);
        end
    end
    
    %start get disparity map
    dis=zeros(1,col_max);
    dis=dis+64;
    row=col_max;
    col=col_max;
    disparity=0;
    count=col_max-1;
    while (col>1||row>1)
        if dir(row,col)==1
            col=col-1;
            row=row-1;
            dis(count)=disparity;
            count=count-1;
        elseif dir(row,col)==2
            row=row-1;
            disparity=disparity+1;
            count=count-1;
            if disparity>maxDisp
                disparity=63;
            end
        elseif dir(row,col)==3
            col=col-1;
            disparity=disparity-1;
        else
            break;
        end
        
    end
    
    map=dis;
end