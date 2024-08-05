function queue = enqueue(queue, item)
    queue{end + 1} = item;
end