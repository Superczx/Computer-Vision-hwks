function g=meanFilter(population)
%https://blogs.mathworks.com/steve/2007/06/15/border-replication-option-of-imresize/
%https://blogs.mathworks.com/steve/2008/07/07/nonlinear-operations-using-imfilter/
    h=ones(3);
    logfilter=imfilter(log(population),h,'replicate');
    changeback=exp(logfilter);
    meanfilter=changeback.^(1/9);
    g=meanfilter;
end