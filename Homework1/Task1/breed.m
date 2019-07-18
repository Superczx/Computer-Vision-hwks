function f=breed(parent1,parent2,choice)
child =blanks(length(parent1));
%midpoint

if choice ==0
    midpoint=randsample([2 length(parent1)-1],1);
    n=1;
    while n<=length(parent1)
        if n <= midpoint
           child(n)=parent1(n);
           n=n+1;
        else
            child(n)=parent2(n);
            n=n+1;
        end
    end
end
% random
if choice==1
    n=1;
    while n<=length(parent1)
        flag=randi(2);
        
        if flag==1
            child(n)=parent1(n);
            n=n+1;
        else
            child(n)=parent2(n);
            n=n+1;
        end
        
    end
end

f=child;

end