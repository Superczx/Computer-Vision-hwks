% Zhixing Chang
% CSCI 4831
% Homework 4
% Ioana Fleming
% 
function map=Outlier_map(imageLR,imageRL,threshold)
    [row_max,col_max]=size(imageLR);
    outlier=zeros(row_max,col_max);
    for row=1:row_max
        for col=1:col_max
            diff=abs(imageLR(row,col)-imageRL(row,col));
            if diff>threshold
                outlier(row,col)=1;
            end
        end
    end
    map=outlier;
end