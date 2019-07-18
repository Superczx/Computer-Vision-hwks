function f= buildMatingPool(fitness,max_ticket)
%ticket_max=pop_max*factor;
%ticket_2nd=pop_2nd_max*factor;
if max(fitness)==0
    factor=0;
else
    factor= max_ticket/max(fitness);
end
fitness_len=length(fitness);
ticket_index=zeros(fitness_len,1);
tickets=zeros(fitness_len,1);
for i=1:fitness_len
     ticket_index(i)=i;
     tickets(i)=round(factor*fitness(i));
end

ticket_sum=sum(tickets);
pool=zeros(ticket_sum,1);
n=1;
for i=1:fitness_len
    if tickets(i)>0
        for j=1:tickets(i)
            pool(n)=ticket_index(i);
            n=n+1;
        end
    end
end
f=pool;
end 
