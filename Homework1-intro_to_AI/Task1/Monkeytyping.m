%1. define target
target=input('target string: ', 's');
pop_size=input('population size: ');
maxgeneration=input('generation time: ');
breedway=input('choose a way to breed, 0 is midpoint, 1 is random: ');
mutation_rate=input('what is the rate of mutation in %:' );
%ini generation
generation=1; 
%max ticket
maxticket=500;
%target character length
target_len=length(target);
%initial population
population=buildPopulation(target_len,pop_size);
% fitness=zeros(1,pop_size);
population1=population;
fitness=calculateFitness(population,target);
[maxfitness,maxindex]=max(fitness);
generationforplot=[];
maxs=[];
averages=[];
diversity=[];
% bestpharses=blanks(maxgeneration);
fileID = fopen('Monkeytypewriter.txt','w');
fprintf(fileID, 'generation   best pharse   maximum fitness   average fitness   diversity\n\n');
%while loop

while generation<=maxgeneration
 
 %   n=1;
            %    population =buildPopulation(target_len,size);
            population=population1;
           %calculate fitness using the last generation
tic,
            fitness=calculateFitness(population,target);
toc
             [maxfitness,maxindex]=max(fitness);
             avgfitness=mean(fitness);
            %disp string with max fitness? 
            %put mating pool into pool array
tic,             pool=buildMatingPool(fitness,maxticket);toc
tic,
             pool_len=length(pool);
             for i=1:pop_size
                 parent1_pool_index=randi(pool_len,1);
                 parent2_pool_index=randi(pool_len,1);

             %if the second index is same as first one, random again
               while parent2_pool_index==parent1_pool_index
                   parent2_pool_index=randsample(1:pool_len,1);
               end
             %using the pool index get the population index from mating pool
             %SINCE mating pool consists of all index from population
               parent1_index=pool(parent1_pool_index);
               parent2_index=pool(parent2_pool_index);
               while parent2_index==parent1_index
                    parent2_pool_index=randsample(1:pool_len,1);
                    parent2_index=pool(parent2_pool_index);
               end
              parent1=population(parent1_index,:);
              parent2=population(parent2_index,:);
toc
tic,              child=breed(parent1,parent2,breedway);toc
 tic,             after_mutate_child=causeMutation(child,mutation_rate);toc
              population1(i,:)=after_mutate_child;
             
%              plot(generation,maxfitness);
             end
%               bestpharses(generation)=population(maxindex,:);
              generationforplot(generation)=generation;
              maxs(generation)=maxfitness;
              averages(generation)=avgfitness;
              diversity(generation)=maxfitness-avgfitness;
              diver=maxfitness-avgfitness;
    if rem(generation,10)==0
        disp(['generation number: ', num2str(generation)])
        disp(['max fitness member: ', population(maxindex,:)])
        disp(['max fitness: ', num2str(maxfitness)])
    end
      plot(generationforplot, maxs,generationforplot,averages,generationforplot,diversity);
      legend('maximum fitness', 'average fitness', 'diversity');
      fprintf(fileID, '%d        %s   %f   %f   %f   \n',generation,population(maxindex,:),maxfitness,avgfitness,diver);
    if population(maxindex,:)==target
        disp(['generation number: ', num2str(generation)])
        disp(['max fitness member: ', population(maxindex,:)])
        disp(['max fitness: ', num2str(maxfitness)])
        break
     end
    generation=generation+1;
    
end

 
 
