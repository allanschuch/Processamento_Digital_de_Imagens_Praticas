function [queue, item] = dequeue(queue)
    if isempty(queue)
        error('empty queue');
    end

    item = queue{1};
    queue(1)=[];
end