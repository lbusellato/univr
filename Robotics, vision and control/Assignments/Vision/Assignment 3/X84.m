function  modelcp = X84(data,model)


modelcp = ones(size(data));
mindist = inf*ones(size(data,1),1);

for i = 1:size(data,1) 
    d = norm(model(j,:) - data(i,:));
    mindist(i)=d;
end

% apply X84
location = median(mindist);
scale = 5.2 * median(abs(mindist-location));

% set points to NaN in order to discard them
I = find(abs(mindist-location) > scale);
modelcp(I,:)=NaN;
