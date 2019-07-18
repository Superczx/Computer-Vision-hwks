function f=breed(parent1,parent2,choice)

[n,m,rgb]=size(parent1);
child=zeros(n,m,rgb);
%midpoint
    if choice ==0
        i=1:n;
        mid=randi(n,1);
        beforemid=1:mid;
        aftermid=mid+1:n;
        child(beforemid,:,:)=parent1(beforemid,:,:);
        child(aftermid,:,:)=parent2(aftermid,:,:);   
    %random combine
    else
        for i=1:n
            for j=1:m
                for k=1:rgb
                    flag=randi(2);
                    if flag==1
                        child(i,j,k)=parent1(i,j,k);
                    else
                        child(i,j,k)=parent2(i,j,k);
                    end
                end
            end
        end
         
    end
    f=child;
end