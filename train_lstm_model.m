% Load data and train LSTM model
load('risk_data.mat');
data = normalize(data);
X = num2cell(data', [1]);
Y = categorical(labels');

layers = [
    sequenceInputLayer(3)
    lstmLayer(50, 'OutputMode', 'last')
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];

options = trainingOptions('adam', ...
    'MaxEpochs', 100, ...
    'GradientThreshold', 1, ...
    'Verbose', 0, ...
    'Plots', 'training-progress');

net = trainNetwork(X, Y, layers, options);
save('risk_predictor_lstm.mat', 'net');


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
