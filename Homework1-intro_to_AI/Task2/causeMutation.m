function f=causeMutation(image,mutationRate,mutationRange,randomMutationRate)
    
    [n,m,rgb]=size(image);

   
    for i=1:n
        for j=1:m
            for k=1:rgb
                 a=randi(round(100/mutationRate));
                 b=randi(round(100/randomMutationRate));
                if a==1
                    if b==1
                        image(i,j,k)=randi([0,255],1);
                    else
                        image(i,j,k)=image(i,j,k)+randi([-mutationRange,mutationRange],1);
                        if image(i,j,k)<0
                            image(i,j,k)=0;
                        elseif image(i,j,k)>255
                            image(i,j,k)=255;
                        end
                    end
                end
            end
        end
    end
    f=image;
end