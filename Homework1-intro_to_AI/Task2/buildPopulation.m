function f=buildPopulation(height,width,size)
    %initial image array
    images=cell(size,1);
    %size is the loop time which is the population size
    for i=1:size
        image={randi([0,255],height,width,3)};
        
        images(i)=image;
    end
    f=images;
end