targetImage=imread('10x10cal.jpg');
target=double(targetImage);
name='cal';
pop_size=input('population size: ');
maxgeneration=input('generation time: ');
% tol1=input('Tol for first way calculating fitness: ');
% tol2=input('Tol for second way calculating fitness: ');
tol1=10;
tol2=20;
breedway=input('choose a way to breed, 0 is midpoint, 1 is random: ');
mutationRate=input('what is the rate of mutation in %:' );
mutationRange=input('what is the range of mutation:' );
randomMutationRate=input('what is the rate of random mutation in %:' );
%size of target and population
[n,m,rgb]=size(targetImage);
population=buildPopulation(n,m,pop_size);
after_mutate_child=population;
child=population;
parent1=population;
parent2=population;
%ini generation
generation=1; 
%max ticket
maxticket=20;
generationforplot=[];
maxs=[];
averages=[];
diversity=[];
fileID = fopen('ImageGenerator.txt','w');
fprintf(fileID, 'generation   best pharse   maximum fitness   average fitness   diversity\n\n');

while generation<=maxgeneration
    population=after_mutate_child;
    fitness=calculateFitness(tol1,tol2,target,population);
    [maxfitness,maxindex]=max(fitness);
    avgfitness=mean(fitness);
    %normalization
    betterfitness=fitness.^3;
    fitness2 = (betterfitness - min(betterfitness)) / ( max(betterfitness) - min(betterfitness) );
    %put mating pool into pool array
    pool=buildMatingPool(fitness2,maxticket);
    pool_len=length(pool);
 
%     for i=1:pop_size
        parent1_pool_index=randi(pool_len,1,pop_size);
        parent2_pool_index=randi(pool_len,1,pop_size);
     %using the pool index get the population index from mating pool
     %SINCE mating pool consists of all index from population
        parent1_index=pool(parent1_pool_index(1:pop_size));
        parent2_index=pool(parent2_pool_index(1:pop_size));
     %if the second index is same as first one, random again
     for i=1:pop_size
         while parent2_index(i)==parent1_index(i)
             parent2_pool_index(i)=randi(pool_len,1);
             parent2_index(i)=pool(parent2_pool_index(i));
         end
        parent1{i}=population{parent1_index(i)};
        parent2{i}=population{parent2_index(i)};
     end

    for i=1:pop_size
        child{i}=breed(parent1{i},parent2{i},breedway);
        after_mutate_child{i}=causeMutation(child{i},mutationRate,mutationRange,randomMutationRate);
    end
%     end
              im=uint8(population{maxindex});
              filename = sprintf('%s_%d.png',name, generation);
              imwrite(im, filename);
              generationforplot(generation)=generation;
              maxs(generation)=maxfitness;
              averages(generation)=avgfitness;
              diversity(generation)=maxfitness-avgfitness;
              diver=maxfitness-avgfitness;
              fprintf(fileID, '%d      %f   %f   %f   \n',generation,maxfitness,avgfitness,diver);
      plot(generationforplot, maxs,generationforplot,averages,generationforplot,diversity);
      legend('maximum fitness', 'average fitness', 'diversity');
    if rem(generation,10)==0
        disp(['generation number: ', num2str(generation)])
%         disp(['max fitness member: ', population{maxindex}])
        disp(['max fitness: ', num2str(maxfitness)])
    end
    if population{maxindex}==target
        disp(['generation number: ', num2str(generation)])
%         disp(['max fitness member: ', population{maxindex}])
        disp(['max fitness: ', num2str(maxfitness)])
        break
     end
    generation=generation+1;
end
imshow(uint8(population{maxindex}));