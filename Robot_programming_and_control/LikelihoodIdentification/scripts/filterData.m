function filteredData = filterData(data, cutoffFrequency)
    %   FILTERDATA Applies a Butterworth filter to a dataset
    %
    %   filteredData = FILTERDATA(data, time, cutoffFrequency) applies a
    %   Butterworth filter to data using time to compute the sampling
    %   frequency and using cutoffFrequency as cutoff frequency. data is
    %   assumed to be structured like:
    %
    %       [time var1 var2 ... varn]
    %
    %   filteredData is a matrix like:
    %
    %       [filtered_var1 filtered_var2 ... filtered_varn]
    %
    
    % Input arguments check
    assert(nargin == 2, 'filterData.m: Not enough input arguments.');
    % Compute sampling frequency
    ts = mean(diff(data(:,1)));
    halfSamplingFrequency = 1 / (2.*ts);
    % Compute the transfer function of the filter
    [B, A] = butter(8, cutoffFrequency / halfSamplingFrequency);
    % Filter the data
    filteredData = nan(size(data));
    for i = 2:size(data,2)
        filteredData(:,i-1) = filter(B, A, data(:,i));
    end
end