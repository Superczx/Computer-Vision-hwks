function f= calculateFitness(population,target)
%split chars
    fitness=zeros(length(population),1 );
    targetchar=num2cell(target);
    for i=1:length(population)
        randchar=num2cell(population(i,:));
    %comparasion
        logical=strcmp(randchar,targetchar);
        len=length(logical);
    %calculate fitness
        fitness(i)=sum(logical)/len;
    end
    f=fitness;
end
