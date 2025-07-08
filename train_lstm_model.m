% Load raw data
load('risk_data.mat');  % Assumes 'data' and 'labels' are available

% Check if data and labels exist
if ~exist('data', 'var') || ~exist('labels', 'var')
    error('The variables "data" and "labels" must exist in risk_data.mat.');
end

% Check for NaN and Inf
fprintf("Initial check...\n");
fprintf("Total NaNs: %d\n", nnz(isnan(data)));
fprintf("Total Infs: %d\n", nnz(isinf(data)));

% Clean the data: Option A - Remove rows with NaN or Inf
valid_rows = all(~isnan(data), 2) & all(~isinf(data), 2);
data = data(valid_rows, :);
labels = labels(valid_rows);

% Normalize data between 0 and 1
data = rescale(data, 0, 1);  % Feature-wise normalization

% Prepare sequences for LSTM
X = num2cell(data', [1]);           % 1 cell per time series
Y = categorical(labels');           % Label as categorical

% Ensure labels and input match
assert(numel(X) == numel(Y), 'Mismatch between input data and labels');

% Define LSTM architecture
inputSize = size(data, 2);
numClasses = numel(unique(Y));

layers = [
    sequenceInputLayer(inputSize)
    lstmLayer(50, 'OutputMode', 'last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer
];

% Training options
options = trainingOptions('adam', ...
    'InitialLearnRate', 0.001, ...
    'MaxEpochs', 100, ...
    'GradientThreshold', 1, ...
    'Verbose', false, ...
    'Plots', 'training-progress');

% Train LSTM model
fprintf("Training started...\n");
net = trainNetwork(X, Y, layers, options);

% Save the trained model
save('risk_predictor_lstm.mat', 'net');
fprintf("Training complete. Model saved as risk_predictor_lstm.mat\n");
