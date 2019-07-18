function f=causeMutation(string,rate)
    population=[32,65:90,97:122];
    for i=1:length(string)
        a=randi(round(100/rate));
        if a==1
            string(i)=char(randsample(population,1,true));
        end
    
    end
    f=string;
end