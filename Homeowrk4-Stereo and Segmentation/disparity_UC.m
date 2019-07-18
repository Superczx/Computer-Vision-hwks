% Zhixing Chang
% CSCI 4831
% Homework 4
% Ioana Fleming
% 
function map=disparity_UC(image_left,image_right,range) 
    image_left=double(image_left);
    image_right = double(image_right);
    [row_max, col_max]=size(image_left);
    bool_map=ones(row_max,col_max);
    d=zeros(row_max,col_max);
    for row=1:row_max-range
        for col=1:col_max-64
            upper=row-range;
            lower=row+range;
            if upper<1
                upper=1;
            end
            if lower>row_max
                lower=row_max;
            end
            for i=1:64
                r=1;
                for new_row=upper:lower
                    disparity(r,i)=sqrt((image_left(new_row,col+i)-image_right(row,col))^2);
                    r=r+1;
                end
            end
            [row_min,row_index]=min(disparity);
            [~,col_index]=min(row_min);
            if row_index(col_index)>size(disparity,1)-range
                if bool_map(row+(row_index(col_index)-(size(disparity,1)-range)),col+col_index-1)
                    d(row,col)=col_index;
                    bool_map(row+(row_index(col_index)-(size(disparity,1)-range)),col+col_index-1)=0;
                else
                    d(row,col)=64;
                end
            elseif row_index(col_index)<size(disparity,1)-range
                if bool_map(row-(row_index(col_index)-(size(disparity,1)-range)),col+col_index-1)
                    d(row,col)=col_index;
                    bool_map(row-(row_index(col_index)-(size(disparity,1)-range)),col+col_index-1)=0;
                else
                    d(row,col)=64;
                end
            else
                if bool_map(row,col+col_index-1)
                    d(row,col)=col_index;
                    bool_map(row,col+col_index-1)=0;
                else
                    d(row,col)=64;
                end
            end
        end
%         row
    end
   map=d; 
end