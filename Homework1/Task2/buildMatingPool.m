function f= buildMatingPool(fitness,factor)
%ticket_max=pop_max*factor;
%ticket_2nd=pop_2nd_max*factor;
% if max(fitness)==0
%     factor=0;
% else
%     factor= max_ticket/max(fitness);
% end
fitness_len=length(fitness);
ticket_index=1:fitness_len;
tickets=zeros(fitness_len,1);
i=1:fitness_len;
tickets(i)=round(factor*fitness(i));
%ini pool using total number of tickets
% ticket_sum=sum(tickets);
pool=[];

for i=1:fitness_len
        for j=1:tickets(i)
            pool=[pool ticket_index(i)];
            
        end
end
f=pool;
end 
