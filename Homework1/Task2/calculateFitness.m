function f=calculateFitness(normaltol,postol,target,population)
    fitness1=zeros(length(population),1 );
    fitness2=zeros(length(population),1 );
    fitness3=zeros(length(population),1 );
    fitness4=zeros(length(population),1 );
    %fitness 1 normal
%     i=[1:length(population)];
    for i=1:length(population)
        logical{i}=abs(target-population{i})<=normaltol;
        fitness1(i)=sum(sum(sum(logical{i})))/numel(logical{i});
    %fitness 2 meanfilter
          logical2{i}=abs(meanFilter(population{i})-meanFilter(target))<=normaltol;    
         fitness2(i)=sum(sum(sum(logical2{i})))/numel(logical2{i});
    %fitness 3 updown
        logical3{i}=abs(abs(diff(target))-abs(diff(population{i})))<postol;
    
        fitness3(i)=sum(sum(sum(logical3{i})))/numel(logical3{i});
    %fitness 4 left right
    Ttarget=permute(target,[2,1,3]);
        newpop{i}=permute(population{i},[2,1,3]);
        logical4{i}=abs(abs(diff(Ttarget))-abs(diff(newpop{i})))<postol;
        fitness4(i)=sum(sum(sum(logical4{i})))/numel(logical4{i});
    %quadrature
        fit_total(i)=(fitness1(i)+fitness2(i)+fitness3(i)+fitness4(i))/4;
%          fit_total(i)=sqrt(fitness1(i).^2+fitness2(i)+fitness3(i).^2+fitness4(i).^2)/2;
    end
    f=fit_total;

    
end

