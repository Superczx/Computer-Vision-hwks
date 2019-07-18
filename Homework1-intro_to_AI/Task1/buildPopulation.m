function f=buildPopulation(n,size)
    %population contains all letter and space
    population=[32,65:90,97:122];
%      population=[32:122];
    %initial character array
    string=blanks(n);
    %loop the random strings consists of characters 
    %size is the loop time which is the population size
    for i=1:size
        string_num=randsample(population,n,true);
        %row i of string is the random number convert to char
        %each column of a row is a char
        string(i,:)=char(string_num);
    end
    f=string;
end